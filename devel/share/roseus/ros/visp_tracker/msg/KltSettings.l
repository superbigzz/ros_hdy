;; Auto-generated. Do not edit!


(when (boundp 'visp_tracker::KltSettings)
  (if (not (find-package "VISP_TRACKER"))
    (make-package "VISP_TRACKER"))
  (shadow 'KltSettings (find-package "VISP_TRACKER")))
(unless (find-package "VISP_TRACKER::KLTSETTINGS")
  (make-package "VISP_TRACKER::KLTSETTINGS"))

(in-package "ROS")
;;//! \htmlinclude KltSettings.msg.html


(defclass visp_tracker::KltSettings
  :super ros::object
  :slots (_max_features _window_size _quality _min_distance _harris _size_block _pyramid_lvl _mask_border ))

(defmethod visp_tracker::KltSettings
  (:init
   (&key
    ((:max_features __max_features) 0)
    ((:window_size __window_size) 0)
    ((:quality __quality) 0.0)
    ((:min_distance __min_distance) 0.0)
    ((:harris __harris) 0.0)
    ((:size_block __size_block) 0)
    ((:pyramid_lvl __pyramid_lvl) 0)
    ((:mask_border __mask_border) 0)
    )
   (send-super :init)
   (setq _max_features (round __max_features))
   (setq _window_size (round __window_size))
   (setq _quality (float __quality))
   (setq _min_distance (float __min_distance))
   (setq _harris (float __harris))
   (setq _size_block (round __size_block))
   (setq _pyramid_lvl (round __pyramid_lvl))
   (setq _mask_border (round __mask_border))
   self)
  (:max_features
   (&optional __max_features)
   (if __max_features (setq _max_features __max_features)) _max_features)
  (:window_size
   (&optional __window_size)
   (if __window_size (setq _window_size __window_size)) _window_size)
  (:quality
   (&optional __quality)
   (if __quality (setq _quality __quality)) _quality)
  (:min_distance
   (&optional __min_distance)
   (if __min_distance (setq _min_distance __min_distance)) _min_distance)
  (:harris
   (&optional __harris)
   (if __harris (setq _harris __harris)) _harris)
  (:size_block
   (&optional __size_block)
   (if __size_block (setq _size_block __size_block)) _size_block)
  (:pyramid_lvl
   (&optional __pyramid_lvl)
   (if __pyramid_lvl (setq _pyramid_lvl __pyramid_lvl)) _pyramid_lvl)
  (:mask_border
   (&optional __mask_border)
   (if __mask_border (setq _mask_border __mask_border)) _mask_border)
  (:serialization-length
   ()
   (+
    ;; int64 _max_features
    8
    ;; int64 _window_size
    8
    ;; float64 _quality
    8
    ;; float64 _min_distance
    8
    ;; float64 _harris
    8
    ;; int64 _size_block
    8
    ;; int64 _pyramid_lvl
    8
    ;; int64 _mask_border
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _max_features
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _max_features (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _max_features) (= (length (_max_features . bv)) 2)) ;; bignum
              (write-long (ash (elt (_max_features . bv) 0) 0) s)
              (write-long (ash (elt (_max_features . bv) 1) -1) s))
             ((and (class _max_features) (= (length (_max_features . bv)) 1)) ;; big1
              (write-long (elt (_max_features . bv) 0) s)
              (write-long (if (>= _max_features 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _max_features s)(write-long (if (>= _max_features 0) 0 #xffffffff) s)))
     ;; int64 _window_size
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _window_size (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _window_size) (= (length (_window_size . bv)) 2)) ;; bignum
              (write-long (ash (elt (_window_size . bv) 0) 0) s)
              (write-long (ash (elt (_window_size . bv) 1) -1) s))
             ((and (class _window_size) (= (length (_window_size . bv)) 1)) ;; big1
              (write-long (elt (_window_size . bv) 0) s)
              (write-long (if (>= _window_size 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _window_size s)(write-long (if (>= _window_size 0) 0 #xffffffff) s)))
     ;; float64 _quality
       (sys::poke _quality (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _min_distance
       (sys::poke _min_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _harris
       (sys::poke _harris (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int64 _size_block
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _size_block (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _size_block) (= (length (_size_block . bv)) 2)) ;; bignum
              (write-long (ash (elt (_size_block . bv) 0) 0) s)
              (write-long (ash (elt (_size_block . bv) 1) -1) s))
             ((and (class _size_block) (= (length (_size_block . bv)) 1)) ;; big1
              (write-long (elt (_size_block . bv) 0) s)
              (write-long (if (>= _size_block 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _size_block s)(write-long (if (>= _size_block 0) 0 #xffffffff) s)))
     ;; int64 _pyramid_lvl
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _pyramid_lvl (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _pyramid_lvl) (= (length (_pyramid_lvl . bv)) 2)) ;; bignum
              (write-long (ash (elt (_pyramid_lvl . bv) 0) 0) s)
              (write-long (ash (elt (_pyramid_lvl . bv) 1) -1) s))
             ((and (class _pyramid_lvl) (= (length (_pyramid_lvl . bv)) 1)) ;; big1
              (write-long (elt (_pyramid_lvl . bv) 0) s)
              (write-long (if (>= _pyramid_lvl 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _pyramid_lvl s)(write-long (if (>= _pyramid_lvl 0) 0 #xffffffff) s)))
     ;; int64 _mask_border
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _mask_border (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _mask_border) (= (length (_mask_border . bv)) 2)) ;; bignum
              (write-long (ash (elt (_mask_border . bv) 0) 0) s)
              (write-long (ash (elt (_mask_border . bv) 1) -1) s))
             ((and (class _mask_border) (= (length (_mask_border . bv)) 1)) ;; big1
              (write-long (elt (_mask_border . bv) 0) s)
              (write-long (if (>= _mask_border 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _mask_border s)(write-long (if (>= _mask_border 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _max_features
#+(or :alpha :irix6 :x86_64)
      (setf _max_features (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _max_features (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _window_size
#+(or :alpha :irix6 :x86_64)
      (setf _window_size (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _window_size (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _quality
     (setq _quality (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _min_distance
     (setq _min_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _harris
     (setq _harris (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int64 _size_block
#+(or :alpha :irix6 :x86_64)
      (setf _size_block (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _size_block (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _pyramid_lvl
#+(or :alpha :irix6 :x86_64)
      (setf _pyramid_lvl (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _pyramid_lvl (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _mask_border
#+(or :alpha :irix6 :x86_64)
      (setf _mask_border (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _mask_border (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get visp_tracker::KltSettings :md5sum-) "7cd8ae2f3a31d26015e8c80e88eb027a")
(setf (get visp_tracker::KltSettings :datatype-) "visp_tracker/KltSettings")
(setf (get visp_tracker::KltSettings :definition-)
      "# This message contains tracking parameters.
#
# These parameters determine how precise, how fast and how
# reliable will be the tracking.
#
# It should be tuned carefully and can be changed dynamically.
#
# For more details, see the ViSP documentation:
# http://www.irisa.fr/lagadic/visp/publication.html

# Klt Parameters.

int64 max_features      # Maximum number of features
int64 window_size       # Window size
float64 quality         # Quality of the tracker
float64 min_distance      # Minimum distance betwenn two points
float64 harris          # Harris free parameters
int64 size_block        # Block size
int64 pyramid_lvl       # Pyramid levels
int64 mask_border       # Mask Border


")



(provide :visp_tracker/KltSettings "7cd8ae2f3a31d26015e8c80e88eb027a")


