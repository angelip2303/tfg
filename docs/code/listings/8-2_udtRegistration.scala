class ThirdPartyClassUDT extends UserDefinedType[ThirdPartyClass] {
  ...
}

UDTRegistration.register(
  classOf[ThirdPartyClass].getName, 
  classOf[ThirdPartyClassUDT].getName
)