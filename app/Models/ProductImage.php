<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    /**
     * @var string
     */
    protected $table = 'product_images';

    /**
     * @var array
     */
    protected $fillable = ['product_id', 'full'];
 //   protected $fillable = ['product_id', 'thumbnail', 'full'];

    /**
     * @var array
     */
    protected $casts = [
        'product_id'    =>  'integer',
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    /**
	 * @return \Illuminate\Database\Eloquent\Relations\HasMany
	 */
	public function images()
	{
	    return $this->hasMany(ProductImage::class);
	}
}