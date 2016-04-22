(require 'android-defs)
(require <com.clinoge.dailyoscar.aporrea>)
(activity main
    (on-create-view
        (let ((dt (get-page "http://www.google.com")))
            (android.widget.TextView (this)
                text: (->string dt)))))
