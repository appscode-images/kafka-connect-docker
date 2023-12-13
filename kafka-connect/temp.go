
package main

import (
    "crypto/tls"
    "crypto/x509"
    "io/ioutil"
    "log"
)

func main() {
    // Load certificate and key files
    cert, err := ioutil.ReadFile("/path/to/cert.crt")
    if err != nil {
        log.Fatal(err)
    }
    key, err := ioutil.ReadFile("/path/to/key.key")
    if err != nil {
        log.Fatal(err)
    }

    // Create a new TLS certificate from the certificate and key files
    tlsCert, err := tls.X509KeyPair(cert, key)
    if err != nil {
        log.Fatal(err)
    }

    // Load CA certificate file
    caCert, err := ioutil.ReadFile("/path/to/ca.crt")
    if err != nil {
        log.Fatal(err)
    }

    // Create a new certificate pool and add the CA certificate
    caCertPool := x509.NewCertPool()
    caCertPool.AppendCertsFromPEM(caCert)

    // Create a new TLS configuration with the certificate and CA certificate pool
    tlsConfig := &tls.Config{
        Certificates: []tls.Certificate{tlsCert},
        RootCAs:      caCertPool,
    }

    // Create a new empty keystore and truststore JKS files
    keystoreFile, err := os.Create("/path/to/keystore.jks")
    if err != nil {
        log.Fatal(err)
    }
    defer keystoreFile.Close()
    truststoreFile, err := os.Create("/path/to/truststore.jks")
    if err != nil {
        log.Fatal(err)
    }
    defer truststoreFile.Close()

    // Convert the TLS configuration to JKS format and write to the keystore and truststore files
    err = tlsConfig.WriteToKeystore(keystoreFile, "JKS", "keystore_password", "key_password")
    if err != nil {
        log.Fatal(err)
    }
    err = tlsConfig.WriteToTruststore(truststoreFile, "JKS", "truststore_password")
    if err != nil {
        log.Fatal(err)
    }
}
