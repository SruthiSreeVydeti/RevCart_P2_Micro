import { Component, OnInit } from '@angular/core';
import { ProductService } from '../services/product.service';

@Component({
  selector: 'app-product-list',
  template: `
    <div class="container mt-4">
      <h2>Products</h2>
      <div class="row">
        <div class="col-md-3" *ngFor="let product of products">
          <div class="card mb-4">
            <img [src]="product.imageUrl || 'https://via.placeholder.com/200'" class="card-img-top" [alt]="product.name">
            <div class="card-body">
              <h5 class="card-title">{{product.name}}</h5>
              <p class="card-text">{{product.description}}</p>
              <p class="card-text"><strong>\${{product.price}}</strong></p>
              <a [href]="'/products/' + product.id" class="btn btn-primary btn-sm">View Details</a>
              <button class="btn btn-success btn-sm ms-2" (click)="addToCart(product)">Add to Cart</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  `
})
export class ProductListComponent implements OnInit {
  products: any[] = [];

  constructor(private productService: ProductService) {}

  ngOnInit() {
    this.productService.getProducts().subscribe({
      next: (data) => this.products = data,
      error: (error) => console.error('Error loading products', error)
    });
  }

  addToCart(product: any) {
    console.log('Adding to cart:', product);
    // Cart functionality will be handled by cart-mfe
  }
}