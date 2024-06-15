<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;


class News extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    protected $fillable = [
        'title', 'description', 'custom_date', 'category_id', 'user_id', 'main_image_id'
    ];

    
    protected $casts = [
        'custom_date' => 'date',
    ];
    

    // Define the relationship with User model
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Define the relationship with Category model
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    // Define the relationship with Tag model
    public function tags()
    {
        return $this->belongsToMany(Tag::class, 'news_tags', 'news_id', 'tag_id');
    }

    public function mainImage()
    {
        return $this->hasOne(Media::class, 'id', 'main_image_id');
    }

    public function getMainImageUrlAttribute()
    {
        return $this->mainImage ? $this->mainImage->getUrl() : '/path/to/default-image.jpg';
    }
    
}
