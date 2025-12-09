import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

interface CartItem {
  id: number;
  productId: number;
  productName: string;
  price: number;
  quantity: number;
}

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  cartItems: CartItem[] = [];
  total = 0;
  apiUrl = 'http://localhost:8090/api/cart';

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.loadCart();
  }

  loadCart() {
    this.http.get<CartItem[]>(this.apiUrl).subscribe({
      next: (data) => {
        this.cartItems = data;
        this.calculateTotal();
      },
      error: (err) => console.error('Error loading cart', err)
    });
  }

  updateQuantity(item: CartItem) {
    this.http.put(`${this.apiUrl}/update`, item).subscribe({
      next: () => this.calculateTotal(),
      error: (err) => console.error('Error updating quantity', err)
    });
  }

  removeItem(itemId: number) {
    this.http.delete(`${this.apiUrl}/remove/${itemId}`).subscribe({
      next: () => this.loadCart(),
      error: (err) => console.error('Error removing item', err)
    });
  }

  calculateTotal() {
    this.total = this.cartItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);
  }

  checkout() {
    alert('Proceeding to checkout...');
  }
}
