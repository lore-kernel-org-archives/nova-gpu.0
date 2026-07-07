Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8631B3438BF;
	Tue,  7 Jul 2026 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433614; cv=none; b=L53GHY/7FDcyj8Y6uiDW2UojwiTqjCuUGeruRGfLJgKQ4zvcIYxR4WI/LT9rkHXlzhgEX1W0i47akIsy0mpGFO2Oy1u1lbEVlPY84hErrEV9pAyksZO6uYNqxlTOZbmQ+Z6XKfhPf5tDou1LZS5xd6+7Dy7ZcgkKogRS16c8XkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433614; c=relaxed/simple;
	bh=30xNEvQvi3DRnaEKmNYUDzzvfkMDU66lVXlJxLHeaZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlVu1oyYiVtLRedIMQEyJL5lWyssnrb6D7bMBh31igEGSjOONdJ8PkVHAtDbd2ySrTwjRRkNqUfxV6I2A8ycKYldLmqM9WlgIGxEOBGGGxq8/uTQEcotVWDAYvwYx9ClFKYWMB6P15lyjpiZjQoWvKGCSW5R/FtqbCMuqek8Tf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gSQ5B7Oq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gSQ5B7Oq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF3A1F000E9;
	Tue,  7 Jul 2026 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783433613;
	bh=J6C38rx2JSkSOtyq1WfERheiOFWJxUZh4/ZR3hoXaXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gSQ5B7OqnVqZLWVPb5DlcrhsSpGOvZMYQRK0Sj3GKQ1/I7OYmxldyA9xHBWd5psgY
	 9oqRVS5TdBV0QfGs9x2xv5W3eWNMNvxRP4aw5oehefFb8zPx7Z3dj/8BAUSHydMYsd
	 m98vLvVICr5Fh9XtS1tSZdc0pWgSB6LGxAkkG40w=
Date: Tue, 7 Jul 2026 16:13:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <bqe@google.com>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] rust: id_pool: add contiguous area allocation
Message-ID: <2026070745-unwired-maybe-769e@gregkh>
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com>
 <20260703-chid-v1-3-84fe8259e46e@nvidia.com>
 <2026070334-dollar-hexagram-e49c@gregkh>
 <DJSDFHOADWYL.V4WC2TI9UWYF@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJSDFHOADWYL.V4WC2TI9UWYF@nvidia.com>

On Tue, Jul 07, 2026 at 10:25:27PM +0900, Eliot Courtney wrote:
> On Fri Jul 3, 2026 at 7:31 PM JST, Greg KH wrote:
> > On Fri, Jul 03, 2026 at 07:16:06PM +0900, Eliot Courtney wrote:
> >> Add support for contiguous area allocation. Add a new type,
> >> `UnusedArea`, following the same pattern as `UnusedId`.
> >> 
> >> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> >
> > Why isn't the built-in idr library being used here instead of rolling
> > your own data structure?
> >
> > thanks,
> >
> > greg k-h
> 
> For nova-core in this series, we need allocation of a contiguous
> sequence of IDs with a specific length and sometimes a specific
> alignment. IIUC, IDA/xarray do not support that (I checked
> ida_alloc_range and it only allocates a single ID in a range, not a
> contiguous sequence).
> 
> For IdPool before this series, I think it could have used IDA/xarray.
> See [1] where Alice has posted some more context.
> 
> w.r.t. the structure choice, the IDs we need to allocate are channel
> IDs, and the total range is limited to 2048 of them, so IMO bitmaps are
> a better fit than e.g. maple tree.

But again, you are having to "roll your own" logic here, please reuse
the data structures we already have in the kernel for this type of
thing.  If a maple tree works, please use it.

thanks,

greg k-h
