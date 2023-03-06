@DeveloperApi
@Since("3.2.0")
abstract class UserDefinedType[UserType >: Null] 
    extends DataType with Serializable 
{
  /** Underlying storage type for this UDT */
  def sqlType: DataType

  /**Convert the user type to a SQL datum */
  def serialize(obj: UserType): Any

  /** Convert a SQL datum to the user type */
  def deserialize(datum: Any): UserType

  /** Class object for the UserType */
  def userClass: java.lang.Class[UserType]
}
