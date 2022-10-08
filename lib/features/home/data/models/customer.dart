class Customer {
  int numero;
  int cantidad;
  int foto;

  Customer(this.numero, this.cantidad, this.foto);

  @override
  String toString() {
    return '{ ${this.numero}, ${this.cantidad},${this.foto} }';
  }
}
