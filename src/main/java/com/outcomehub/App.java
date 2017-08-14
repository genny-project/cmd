package com.outcomehub;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import org.jboss.resteasy.client.ClientRequest;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;

import io.vertx.core.Vertx;
import io.vertx.core.buffer.Buffer;
import io.vertx.core.json.DecodeException;

public class App {

	// private EventBus eventBus = null;
	private Buffer data = null;
	@Parameter(names = "--help", help = true)
	private boolean help = false;
	Vertx vertx = Vertx.vertx();

	@Parameter(names = { "--event-code", "-e" }, description = "Event code")
	String eventCode;

	@Parameter(names = { "--token", "-t" }, description = "Keycloak Security Token")
	String token;

	@Parameter(names = { "--target-entity-code", "-c" }, description = "Target entity code")
	String targetCode;

	@Parameter(names = { "--data", "-d" }, description = "json data")
	String jsonData = "{}";

	@Parameter(names = { "--address", "-a" }, description = "event bus address")
	String eventBusAddress = "{}";

	@Parameter(names = { "--quiet", "-q" }, description = "enables quiet mode - true/false")
	private boolean quiet = false;

	public static void main(String... args) {
		App main = new App();

		if (!main.quiet) {
			System.out.println("Genny Event Bus Command Line\n");
		}
		JCommander jCommander = new JCommander(main, args);
		if ((main.help) || ((args.length == 0))) {
			jCommander.usage();
			return;
		}
		if (args.length > 0) {
			main.runs();
		}
	}

	public void runs() {
		getFile();

		if (!quiet) {
			System.out.println("Sent: " + eventBusAddress);
		}
	}

	public void getFile() {

		vertx.fileSystem().readFile(jsonData, d -> {
			if (!d.failed()) {
				try {
					data = d.result();
				} catch (DecodeException dE) {
					data = d.result();
				}
				try {
					runVertx();
					vertx.close();

				} catch (SocketException e) {
					e.printStackTrace();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}

			} else {
				System.err.println("Error reading data.json file!");
			}
		});
	}

	public void runVertx() throws SocketException, UnknownHostException {

		vertx.executeBlocking(future -> {

			Buffer buf = data.getBuffer(0, data.length());

			try {
				ClientRequest request = new ClientRequest(eventBusAddress);
			//	List<String> headerStringList = new ArrayList<String>();
			//	headerStringList.add("Bearer "+token);
			//	request.getHeaders().put("Authorization", headerStringList);
				request.getQueryParameters().add("token", token);
				request.accept("application/json");
				request.body("text/plain", buf.toString());
				request.post(String.class);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}, res -> {
			if (res.succeeded()) {
				System.out.println("Command Sent");;
			}
		});

	}

}
