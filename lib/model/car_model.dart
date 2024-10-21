class ProductModel{
  String Date;
  String Carname;
  String Model;
  String Purchasedamount;
  String Expanse;
  String Soldamount;
  String dropdownValue;
  List images;
  String image;
  DateTime uploadedTime;
  String ProductId;

  ProductModel({
    required this.Date,
    required this.Carname,
    required this.Model,
    required this.Purchasedamount,
    required this.Expanse,
    required this.Soldamount,
    required this.dropdownValue,
    required this.images,
    required this.image,
    required this.uploadedTime,
    required this.ProductId,
  });
  factory ProductModel.fromJson(Map<String,dynamic>json)=>ProductModel(
      Date: json["Date"],
      Carname: json["Carname"],
      Model: json["Model"],
      Purchasedamount: json["Purchasedamount"],
      Expanse: json["Expanse"],
      Soldamount: json["Soldamount"],
      dropdownValue: json["Status"],
      images: json["images"],
      image: json["image"],
      uploadedTime: json["uploadedTime"].toDate(),
      ProductId: json["ProductId"]
  );
  Map<String,dynamic>toJson()=>{
    "Date":Date,
    "Carname":Carname,
    "Model":Model,
    "Purchasedamount":Purchasedamount,
    "Expanse":Expanse,
    "Soldamount":Soldamount,
    "Status":dropdownValue,
    "images":images,
    "image":image,
    "uploadedTime":uploadedTime,
    "ProductId":ProductId,
  };
  ProductModel copyWith({
    String?Date,
    String?Carname,
    String?Model,
    String?Purchasedamount,
    String?Expanse,
    String?Soldamount,
    String?dropdownValue,
    List?images,
    String?image,
    DateTime?uploadedTime,
    String ?ProductId
  })
  {
    return ProductModel(
        Date: Date??this.Date,
        Carname: Carname??this.Carname,
        Model: Model??this.Model,
        Purchasedamount: Purchasedamount??this.Purchasedamount,
        Expanse: Expanse??this.Expanse,
        Soldamount: Soldamount??this.Soldamount,
        dropdownValue: dropdownValue??this.dropdownValue,
        images: images??this.images,
        image: image??this.image,
        uploadedTime: uploadedTime??this.uploadedTime as DateTime,
        ProductId: ProductId??this.ProductId
    );
  }

}