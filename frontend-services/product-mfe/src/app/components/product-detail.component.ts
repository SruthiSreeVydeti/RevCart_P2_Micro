import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from '../services/product.service';

@Component({
  selector: 'app-product-detail',
  template: `
    <div class="container mt-4" *ngIf="product">
      <div class="row">
        <div class="col-md-6">
          <img [src]="product.imageUrl || 'https://via.placeholder.com/400'" class="img-fluid" [alt]="product.name">
        </div>
        <div class="col-md-6">
          <h2>{{product.name}}</h2>
          <p class="lead">{{product.description}}</p>
          <h3 class="text-success">\${{product.price}}</h3>
          <p>Category: {{product.category}}</p>
          <p>Stock: {{product.stock}}</p>
          <button class="btn btn-primary btn-lg" (click)="addToCart()">Add to Cart</button>
          <a href="/products" class="btn btn-secondary btn-lg ms-2">Back to Products</a>
        </div>
      </div>
    </div>
  `
})
export class ProductDetailComponent implements OnInit {
  product: any;

  constructor(
    private route: ActivatedRoute,
    private productService: ProductService
  ) {}

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.productService.getProduct(+id).subscribe({
        next: (data) => this.product = data,
        error: (error) => console.error('Error loading product', error)
      });
    }
  }

  addToCart() {
    console.log('Adding to cart:', this.product);
  }
}