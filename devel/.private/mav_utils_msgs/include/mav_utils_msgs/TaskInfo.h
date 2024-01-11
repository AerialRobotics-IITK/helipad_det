// Generated by gencpp from file mav_utils_msgs/TaskInfo.msg
// DO NOT EDIT!


#ifndef MAV_UTILS_MSGS_MESSAGE_TASKINFO_H
#define MAV_UTILS_MSGS_MESSAGE_TASKINFO_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Point.h>

namespace mav_utils_msgs
{
template <class ContainerAllocator>
struct TaskInfo_
{
  typedef TaskInfo_<ContainerAllocator> Type;

  TaskInfo_()
    : header()
    , loc_type()
    , id(0)
    , position()  {
    }
  TaskInfo_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , loc_type(_alloc)
    , id(0)
    , position(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _loc_type_type;
  _loc_type_type loc_type;

   typedef int32_t _id_type;
  _id_type id;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> const> ConstPtr;

}; // struct TaskInfo_

typedef ::mav_utils_msgs::TaskInfo_<std::allocator<void> > TaskInfo;

typedef boost::shared_ptr< ::mav_utils_msgs::TaskInfo > TaskInfoPtr;
typedef boost::shared_ptr< ::mav_utils_msgs::TaskInfo const> TaskInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mav_utils_msgs::TaskInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mav_utils_msgs::TaskInfo_<ContainerAllocator1> & lhs, const ::mav_utils_msgs::TaskInfo_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.loc_type == rhs.loc_type &&
    lhs.id == rhs.id &&
    lhs.position == rhs.position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mav_utils_msgs::TaskInfo_<ContainerAllocator1> & lhs, const ::mav_utils_msgs::TaskInfo_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mav_utils_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7aa2f2a193cf1ff9ec2367d5c3263859";
  }

  static const char* value(const ::mav_utils_msgs::TaskInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7aa2f2a193cf1ff9ULL;
  static const uint64_t static_value2 = 0xec2367d5c3263859ULL;
};

template<class ContainerAllocator>
struct DataType< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mav_utils_msgs/TaskInfo";
  }

  static const char* value(const ::mav_utils_msgs::TaskInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"string loc_type\n"
"int32 id\n"
"geometry_msgs/Point position\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::mav_utils_msgs::TaskInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.loc_type);
      stream.next(m.id);
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TaskInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mav_utils_msgs::TaskInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mav_utils_msgs::TaskInfo_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "loc_type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.loc_type);
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAV_UTILS_MSGS_MESSAGE_TASKINFO_H
