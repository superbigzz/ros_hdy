;; Auto-generated. Do not edit!


(when (boundp 'visp_tracker::MovingEdgeSettings)
  (if (not (find-package "VISP_TRACKER"))
    (make-package "VISP_TRACKER"))
  (shadow 'MovingEdgeSettings (find-package "VISP_TRACKER")))
(unless (find-package "VISP_TRACKER::MOVINGEDGESETTINGS")
  (make-package "VISP_TRACKER::MOVINGEDGESETTINGS"))

(in-package "ROS")
;;//! \htmlinclude MovingEdgeSettings.msg.html


(defclass visp_tracker::MovingEdgeSettings
  :super ros::object
  :slots (_mask_size _range _threshold _mu1 _mu2 _sample_step _strip _first_threshold ))

(defmethod visp_tracker::MovingEdgeSettings
  (:init
   (&key
    ((:mask_size __mask_size) 0)
    ((:range __range) 0)
    ((:threshold __threshold) 0.0)
    ((:mu1 __mu1) 0.0)
    ((:mu2 __mu2) 0.0)
    ((:sample_step __sample_step) 0)
    ((:strip __strip) 0)
    ((:first_threshold __first_threshold) 0.0)
    )
   (send-super :init)
   (setq _mask_size (round __mask_size))
   (setq _range (round __range))
   (setq _threshold (float __threshold))
   (setq _mu1 (float __mu1))
   (setq _mu2 (float __mu2))
   (setq _sample_step (round __sample_step))
   (setq _strip (round __strip))
   (setq _first_threshold (float __first_threshold))
   self)
  (:mask_size
   (&optional __mask_size)
   (if __mask_size (setq _mask_size __mask_size)) _mask_size)
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:threshold
   (&optional __threshold)
   (if __threshold (setq _threshold __threshold)) _threshold)
  (:mu1
   (&optional __mu1)
   (if __mu1 (setq _mu1 __mu1)) _mu1)
  (:mu2
   (&optional __mu2)
   (if __mu2 (setq _mu2 __mu2)) _mu2)
  (:sample_step
   (&optional __sample_step)
   (if __sample_step (setq _sample_step __sample_step)) _sample_step)
  (:strip
   (&optional __strip)
   (if __strip (setq _strip __strip)) _strip)
  (:first_threshold
   (&optional __first_threshold)
   (if __first_threshold (setq _first_threshold __first_threshold)) _first_threshold)
  (:serialization-length
   ()
   (+
    ;; int64 _mask_size
    8
    ;; int64 _range
    8
    ;; float64 _threshold
    8
    ;; float64 _mu1
    8
    ;; float64 _mu2
    8
    ;; int64 _sample_step
    8
    ;; int64 _strip
    8
    ;; float64 _first_threshold
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _mask_size
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _mask_size (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _mask_size) (= (length (_mask_size . bv)) 2)) ;; bignum
              (write-long (ash (elt (_mask_size . bv) 0) 0) s)
              (write-long (ash (elt (_mask_size . bv) 1) -1) s))
             ((and (class _mask_size) (= (length (_mask_size . bv)) 1)) ;; big1
              (write-long (elt (_mask_size . bv) 0) s)
              (write-long (if (>= _mask_size 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _mask_size s)(write-long (if (>= _mask_size 0) 0 #xffffffff) s)))
     ;; int64 _range
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _range (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _range) (= (length (_range . bv)) 2)) ;; bignum
              (write-long (ash (elt (_range . bv) 0) 0) s)
              (write-long (ash (elt (_range . bv) 1) -1) s))
             ((and (class _range) (= (length (_range . bv)) 1)) ;; big1
              (write-long (elt (_range . bv) 0) s)
              (write-long (if (>= _range 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _range s)(write-long (if (>= _range 0) 0 #xffffffff) s)))
     ;; float64 _threshold
       (sys::poke _threshold (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mu1
       (sys::poke _mu1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _mu2
       (sys::poke _mu2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int64 _sample_step
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _sample_step (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _sample_step) (= (length (_sample_step . bv)) 2)) ;; bignum
              (write-long (ash (elt (_sample_step . bv) 0) 0) s)
              (write-long (ash (elt (_sample_step . bv) 1) -1) s))
             ((and (class _sample_step) (= (length (_sample_step . bv)) 1)) ;; big1
              (write-long (elt (_sample_step . bv) 0) s)
              (write-long (if (>= _sample_step 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _sample_step s)(write-long (if (>= _sample_step 0) 0 #xffffffff) s)))
     ;; int64 _strip
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _strip (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _strip) (= (length (_strip . bv)) 2)) ;; bignum
              (write-long (ash (elt (_strip . bv) 0) 0) s)
              (write-long (ash (elt (_strip . bv) 1) -1) s))
             ((and (class _strip) (= (length (_strip . bv)) 1)) ;; big1
              (write-long (elt (_strip . bv) 0) s)
              (write-long (if (>= _strip 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _strip s)(write-long (if (>= _strip 0) 0 #xffffffff) s)))
     ;; float64 _first_threshold
       (sys::poke _first_threshold (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _mask_size
#+(or :alpha :irix6 :x86_64)
      (setf _mask_size (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _mask_size (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _range
#+(or :alpha :irix6 :x86_64)
      (setf _range (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _range (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _threshold
     (setq _threshold (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mu1
     (setq _mu1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _mu2
     (setq _mu2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int64 _sample_step
#+(or :alpha :irix6 :x86_64)
      (setf _sample_step (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _sample_step (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _strip
#+(or :alpha :irix6 :x86_64)
      (setf _strip (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _strip (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _first_threshold
     (setq _first_threshold (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get visp_tracker::MovingEdgeSettings :md5sum-) "4e8f98b7dec6ffa099529044b3472486")
(setf (get visp_tracker::MovingEdgeSettings :datatype-) "visp_tracker/MovingEdgeSettings")
(setf (get visp_tracker::MovingEdgeSettings :definition-)
      "# This message contains tracking parameters.
#
# These parameters determine how precise, how fast and how
# reliable will be the tracking.
#
# It should be tuned carefully and can be changed dynamically.
#
# For more details, see the ViSP documentation:
# http://www.irisa.fr/lagadic/visp/publication.html


# Moving edge parameters.

int64 mask_size    # Mask size (in pixel) used to compute the image gradient
                   # and determine the object contour.
		   # A larger mask size is better for larger images.
		   # 3 pixels is enough for 640x480 images.
                   # Increasing this value makes the tracking slower.
		   #
		   # Caution: this value cannot be changed dynamically
		   # without resetting the tracking.

int64 range        # Maximum seek distance on both sides of the reference pixel.
      		   # It should match the maximum distance in pixel between
		   # the current position of the feature projection and
		   # its next position.
		   # I.e. if the object moves fast and your tracking
		   # frequency is low, this value should be increased.
                   # Increasing this value makes the tracking slower.

float64 threshold  # Value used to determine if a moving edge is valid
		   # or not.

float64 mu1        # Minimum image contrast allowed to detect a contour.
float64 mu2        # Maximum image contrast allowed to detect a contour.

int64 sample_step   # Minimum distance in pixel between two
      		    # discretization points.
      		    # It avoids having too many discretization points when
		    # the tracked object is far away (and its projection
		    # in the image is small).
		    # Increasing this value makes the tracking *faster*.

int64 strip             # How many pixels are ignored around the borders.


# Tracker parameters.

float64 first_threshold # What proportion of points should be valid to
                        # acccept an initial pose.
			# Value should be between 0 et 1.


")



(provide :visp_tracker/MovingEdgeSettings "4e8f98b7dec6ffa099529044b3472486")


