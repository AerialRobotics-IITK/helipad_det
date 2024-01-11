// Generated by gencpp from file mav_utils_msgs/BBPose.msg
// DO NOT EDIT!


#ifndef MAV_UTILS_MSGS_MESSAGE_BBPOSE_H
#define MAV_UTILS_MSGS_MESSAGE_BBPOSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>

namespace mav_utils_msgs
{
template <class ContainerAllocator>
struct BBPose_
{
  typedef BBPose_<ContainerAllocator> Type;

  BBPose_()
    : boxID(0)
    , type(0)
    , area(0.0)
    , store(false)
    , position()  {
    }
  BBPose_(const ContainerAllocator& _alloc)
    : boxID(0)
    , type(0)
    , area(0.0)
    , store(false)
    , position(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _boxID_type;
  _boxID_type boxID;

   typedef int32_t _type_type;
  _type_type type;

   typedef float _area_type;
  _area_type area;

   typedef uint8_t _store_type;
  _store_type store;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::mav_utils_msgs::BBPose_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mav_utils_msgs::BBPose_<ContainerAllocator> const> ConstPtr;

}; // struct BBPose_

typedef ::mav_utils_msgs::BBPose_<std::allocator<void> > BBPose;

typedef boost::shared_ptr< ::mav_utils_msgs::BBPose > BBPosePtr;
typedef boost::shared_ptr< ::mav_utils_msgs::BBPose const> BBPoseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mav_utils_msgs::BBPose_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mav_utils_msgs::BBPose_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mav_utils_msgs::BBPose_<ContainerAllocator1> & lhs, const ::mav_utils_msgs::BBPose_<ContainerAllocator2> & rhs)
{
  return lhs.boxID == rhs.boxID &&
    lhs.type == rhs.type &&
    lhs.area == rhs.area &&
    lhs.store == rhs.store &&
    lhs.position == rhs.position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mav_utils_msgs::BBPose_<ContainerAllocator1> & lhs, const ::mav_utils_msgs::BBPose_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mav_utils_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mav_utils_msgs::BBPose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_utils_msgs::BBPose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_utils_msgs::BBPose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_utils_msgs::BBPose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_utils_msgs::BBPose_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_utils_msgs::BBPose_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mav_utils_msgs::BBPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e3a05460e544ead82f2d436e3787794c";
  }

  static const char* value(const ::mav_utils_msgs::BBPose_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe3a05460e544ead8ULL;
  static const uint64_t static_value2 = 0x2f2d436e3787794cULL;
};

template<class ContainerAllocator>
struct DataType< ::mav_utils_msgs::BBPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mav_utils_msgs/BBPose";
  }

  static const char* value(const ::mav_utils_msgs::BBPose_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mav_utils_msgs::BBPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 boxID\n"
"int32 type\n"
"float32 area\n"
"bool store\n"
"geometry_msgs/Point position\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::mav_utils_msgs::BBPose_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mav_utils_msgs::BBPose_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.boxID);
      stream.next(m.type);
      stream.next(m.area);
      stream.next(m.store);
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BBPose_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mav_utils_msgs::BBPose_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mav_utils_msgs::BBPose_<ContainerAllocator>& v)
  {
    s << indent << "boxID: ";
    Printer<int32_t>::stream(s, indent + "  ", v.boxID);
    s << indent << "type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.type);
    s << indent << "area: ";
    Printer<float>::stream(s, indent + "  ", v.area);
    s << indent << "store: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.store);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAV_UTILS_MSGS_MESSAGE_BBPOSE_H
