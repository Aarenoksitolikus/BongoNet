package ru.itis.bongodev.bongonet.utils;

public interface MailsGenerator {
    String getMailForConfirm(String serverUrl, String code);
}
