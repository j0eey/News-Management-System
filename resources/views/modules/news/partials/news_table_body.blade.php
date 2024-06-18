@foreach($news as $item)
<tr>
    <td><a href="{{ route('news.show', $item->id) }}">{{ $item->title }}</a></td>
    <td><a href="{{ route('news.show', $item->id) }}">{!! Str::limit(strip_tags($item->description), 50) !!}</a></td>
    <td>
        @if($item->main_image_id)
            @php $mainImage = $item->getMedia('images')->where('id', $item->main_image_id)->first(); @endphp
            @if($mainImage)
                <img src="{{ $mainImage->getUrl() }}" alt="{{ $item->title }}" width="100">
            @else
                <span>Main Image Not Found</span>
            @endif
        @elseif($item->getFirstMedia('images'))
            <img src="{{ $item->getFirstMedia('images')->getUrl() }}" alt="{{ $item->title }}" width="100">
        @else
            <span>No Image Found</span>
        @endif
    </td>
    <td>{{ $item->custom_date }}</td>
    <td>{{ $item->category->title }}</td>
    <td>{{ implode(', ', $item->tags->pluck('title')->toArray() ?? []) }}</td>
    <td>
    <button type="button" class="btn btn-warning" id="editNewsButton" data-permission="edit_news" disabled onclick="window.location.href='{{ route('news.edit', $item->id) }}'">Edit</button>
        <form action="{{ route('news.destroy', $item->id) }}" method="POST" style="display:inline;">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-danger" data-permission="delete_news" disabled>Delete</button>
        </form>
    </td>
</tr>
@endforeach
