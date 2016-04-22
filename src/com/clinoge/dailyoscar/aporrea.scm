(module-export get-page)
(require <kawa.lib.ports>)
(require <kawa.lib.strings>)
(require <kawa.lib.bytevectors>)
(define-alias HttpGet java.net.HttpURLConnection)
(define-alias Url java.net.URL)
(define-alias Reader java.io.BufferedInputStream)

(define (read-file file)
    (let ((x (Reader file)))
        (let f ((y (read-bytevector 1024 x)) (acc ""))
            (if (eof-object? y)
                acc
                (f (read-bytevector 1024 x) 
                    (string-append acc (utf8->string y)))))))

(define (get-page url)
    (let ((connection (->HttpGet ((Url url):openConnection))))
    (begin
        (let (( file (read-file (connection:getInputStream))))
            (connection:disconnect)
        file))))
