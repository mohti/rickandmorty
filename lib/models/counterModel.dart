class CounterModel {
  int loadedlistValue;

  CounterModel(
    this.loadedlistValue
  );
  Map<String, dynamic> toJson() => {
        'loadedlistValue':loadedlistValue ,
        
      };
}
