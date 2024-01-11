;; Auto-generated. Do not edit!


(when (boundp 'mav_utils_msgs::BBox)
  (if (not (find-package "MAV_UTILS_MSGS"))
    (make-package "MAV_UTILS_MSGS"))
  (shadow 'BBox (find-package "MAV_UTILS_MSGS")))
(unless (find-package "MAV_UTILS_MSGS::BBOX")
  (make-package "MAV_UTILS_MSGS::BBOX"))

(in-package "ROS")
;;//! \htmlinclude BBox.msg.html


(defclass mav_utils_msgs::BBox
  :super ros::object
  :slots (_boxID _pixSize _contourSize _colour _diagIndex _areaIndex _eigenIndex _rangeX _rangeY _centre _cornerX _cornerY _eigenVal _eigenVec _contourX _contourY _full _store ))

(defmethod mav_utils_msgs::BBox
  (:init
   (&key
    ((:boxID __boxID) 0)
    ((:pixSize __pixSize) 0)
    ((:contourSize __contourSize) 0)
    ((:colour __colour) "")
    ((:diagIndex __diagIndex) 0.0)
    ((:areaIndex __areaIndex) 0.0)
    ((:eigenIndex __eigenIndex) 0.0)
    ((:rangeX __rangeX) (make-array 0 :initial-element 0 :element-type :integer))
    ((:rangeY __rangeY) (make-array 0 :initial-element 0 :element-type :integer))
    ((:centre __centre) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:cornerX __cornerX) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:cornerY __cornerY) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:eigenVal __eigenVal) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:eigenVec __eigenVec) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:contourX __contourX) (make-array 0 :initial-element 0 :element-type :integer))
    ((:contourY __contourY) (make-array 0 :initial-element 0 :element-type :integer))
    ((:full __full) nil)
    ((:store __store) nil)
    )
   (send-super :init)
   (setq _boxID (round __boxID))
   (setq _pixSize (round __pixSize))
   (setq _contourSize (round __contourSize))
   (setq _colour (string __colour))
   (setq _diagIndex (float __diagIndex))
   (setq _areaIndex (float __areaIndex))
   (setq _eigenIndex (float __eigenIndex))
   (setq _rangeX __rangeX)
   (setq _rangeY __rangeY)
   (setq _centre __centre)
   (setq _cornerX __cornerX)
   (setq _cornerY __cornerY)
   (setq _eigenVal __eigenVal)
   (setq _eigenVec __eigenVec)
   (setq _contourX __contourX)
   (setq _contourY __contourY)
   (setq _full __full)
   (setq _store __store)
   self)
  (:boxID
   (&optional __boxID)
   (if __boxID (setq _boxID __boxID)) _boxID)
  (:pixSize
   (&optional __pixSize)
   (if __pixSize (setq _pixSize __pixSize)) _pixSize)
  (:contourSize
   (&optional __contourSize)
   (if __contourSize (setq _contourSize __contourSize)) _contourSize)
  (:colour
   (&optional __colour)
   (if __colour (setq _colour __colour)) _colour)
  (:diagIndex
   (&optional __diagIndex)
   (if __diagIndex (setq _diagIndex __diagIndex)) _diagIndex)
  (:areaIndex
   (&optional __areaIndex)
   (if __areaIndex (setq _areaIndex __areaIndex)) _areaIndex)
  (:eigenIndex
   (&optional __eigenIndex)
   (if __eigenIndex (setq _eigenIndex __eigenIndex)) _eigenIndex)
  (:rangeX
   (&optional __rangeX)
   (if __rangeX (setq _rangeX __rangeX)) _rangeX)
  (:rangeY
   (&optional __rangeY)
   (if __rangeY (setq _rangeY __rangeY)) _rangeY)
  (:centre
   (&optional __centre)
   (if __centre (setq _centre __centre)) _centre)
  (:cornerX
   (&optional __cornerX)
   (if __cornerX (setq _cornerX __cornerX)) _cornerX)
  (:cornerY
   (&optional __cornerY)
   (if __cornerY (setq _cornerY __cornerY)) _cornerY)
  (:eigenVal
   (&optional __eigenVal)
   (if __eigenVal (setq _eigenVal __eigenVal)) _eigenVal)
  (:eigenVec
   (&optional __eigenVec)
   (if __eigenVec (setq _eigenVec __eigenVec)) _eigenVec)
  (:contourX
   (&optional __contourX)
   (if __contourX (setq _contourX __contourX)) _contourX)
  (:contourY
   (&optional __contourY)
   (if __contourY (setq _contourY __contourY)) _contourY)
  (:full
   (&optional (__full :null))
   (if (not (eq __full :null)) (setq _full __full)) _full)
  (:store
   (&optional (__store :null))
   (if (not (eq __store :null)) (setq _store __store)) _store)
  (:serialization-length
   ()
   (+
    ;; int32 _boxID
    4
    ;; int32 _pixSize
    4
    ;; int32 _contourSize
    4
    ;; string _colour
    4 (length _colour)
    ;; float32 _diagIndex
    4
    ;; float32 _areaIndex
    4
    ;; float32 _eigenIndex
    4
    ;; int32[] _rangeX
    (* 4    (length _rangeX)) 4
    ;; int32[] _rangeY
    (* 4    (length _rangeY)) 4
    ;; float32[] _centre
    (* 4    (length _centre)) 4
    ;; float32[] _cornerX
    (* 4    (length _cornerX)) 4
    ;; float32[] _cornerY
    (* 4    (length _cornerY)) 4
    ;; float32[] _eigenVal
    (* 4    (length _eigenVal)) 4
    ;; float32[] _eigenVec
    (* 4    (length _eigenVec)) 4
    ;; int32[] _contourX
    (* 4    (length _contourX)) 4
    ;; int32[] _contourY
    (* 4    (length _contourY)) 4
    ;; bool _full
    1
    ;; bool _store
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _boxID
       (write-long _boxID s)
     ;; int32 _pixSize
       (write-long _pixSize s)
     ;; int32 _contourSize
       (write-long _contourSize s)
     ;; string _colour
       (write-long (length _colour) s) (princ _colour s)
     ;; float32 _diagIndex
       (sys::poke _diagIndex (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _areaIndex
       (sys::poke _areaIndex (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _eigenIndex
       (sys::poke _eigenIndex (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32[] _rangeX
     (write-long (length _rangeX) s)
     (dotimes (i (length _rangeX))
       (write-long (elt _rangeX i) s)
       )
     ;; int32[] _rangeY
     (write-long (length _rangeY) s)
     (dotimes (i (length _rangeY))
       (write-long (elt _rangeY i) s)
       )
     ;; float32[] _centre
     (write-long (length _centre) s)
     (dotimes (i (length _centre))
       (sys::poke (elt _centre i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _cornerX
     (write-long (length _cornerX) s)
     (dotimes (i (length _cornerX))
       (sys::poke (elt _cornerX i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _cornerY
     (write-long (length _cornerY) s)
     (dotimes (i (length _cornerY))
       (sys::poke (elt _cornerY i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _eigenVal
     (write-long (length _eigenVal) s)
     (dotimes (i (length _eigenVal))
       (sys::poke (elt _eigenVal i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _eigenVec
     (write-long (length _eigenVec) s)
     (dotimes (i (length _eigenVec))
       (sys::poke (elt _eigenVec i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _contourX
     (write-long (length _contourX) s)
     (dotimes (i (length _contourX))
       (write-long (elt _contourX i) s)
       )
     ;; int32[] _contourY
     (write-long (length _contourY) s)
     (dotimes (i (length _contourY))
       (write-long (elt _contourY i) s)
       )
     ;; bool _full
       (if _full (write-byte -1 s) (write-byte 0 s))
     ;; bool _store
       (if _store (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _boxID
     (setq _boxID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _pixSize
     (setq _pixSize (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _contourSize
     (setq _contourSize (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _colour
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _colour (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _diagIndex
     (setq _diagIndex (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _areaIndex
     (setq _areaIndex (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _eigenIndex
     (setq _eigenIndex (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32[] _rangeX
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rangeX (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _rangeX i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _rangeY
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rangeY (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _rangeY i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _centre
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _centre (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _centre i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _cornerX
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cornerX (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _cornerX i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _cornerY
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cornerY (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _cornerY i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _eigenVal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _eigenVal (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _eigenVal i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _eigenVec
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _eigenVec (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _eigenVec i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _contourX
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _contourX (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _contourX i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _contourY
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _contourY (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _contourY i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; bool _full
     (setq _full (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _store
     (setq _store (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get mav_utils_msgs::BBox :md5sum-) "fd2583954c87e86ec1cf450da38931e5")
(setf (get mav_utils_msgs::BBox :datatype-) "mav_utils_msgs/BBox")
(setf (get mav_utils_msgs::BBox :definition-)
      "int32 boxID
int32 pixSize
int32 contourSize
string colour
float32 diagIndex
float32 areaIndex
float32 eigenIndex
int32[] rangeX
int32[] rangeY
float32[] centre
float32[] cornerX
float32[] cornerY
float32[] eigenVal
float32[] eigenVec
int32[] contourX
int32[] contourY
bool full
bool store

")



(provide :mav_utils_msgs/BBox "fd2583954c87e86ec1cf450da38931e5")


