package com.bs.helloboot.config;

import java.io.PrintStream;

import org.springframework.boot.Banner;
import org.springframework.core.env.Environment;

public class MyBanner implements Banner {

    private static final String BANNER = 
          "  _    _      _                            _          _   _             \n"
        + " | |  | |    | |                          | |        | | (_)            \n"
        + " | |__| | ___| | ___ ___  _ __ ___   ___  | |_ ___   | |_ _  ___  _ __  \n"
        + " |  __  |/ _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\ | __/ _ \\  | __| |/ _ \\| '_ \\ \n"
        + " | |  | |  __/ | (_| (_) | | | | | |  __/ | || (_) | | |_| | (_) | | | |\n"
        + " |_|  |_|\\___|_|\\___\\___/|_| |_| |_|\\___|  \\__\\___/   \\__|_|\\___/|_| |_|\n"
        + "                                                                        \n"
        + "                                                                        \n";

    @Override
    public void printBanner(Environment environment, Class<?> sourceClass, PrintStream out) {
        out.print(BANNER);
    }
}
