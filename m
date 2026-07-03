Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50BF3B9DA7;
	Fri,  3 Jul 2026 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074651; cv=none; b=pOxO0rUJ49bb+J933pmXo7rXuLnXgZNSG/NgjOyNGTDqhN+WRikj+6jOi0o+3Z29ovSDh5kFXY5yBwvokpNI582OP0S6UOjvm4JgZYmljdYuwcK2CEFcitPYjzvM6wxWEfCSd+VE1ZrELdd4DsetzYw55pGgKuXrGPvcHoMxSAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074651; c=relaxed/simple;
	bh=TaUa8d+Q4fY9gF9PrUtdIj+sSkVs3H28DkkJFY3A424=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d//Cz8QxQRfnZ2fkF83IC1yriRbWemdDXOSthEasxU0wesi3Dfam+rsWcTtwDAs7wa/RiS2GbLT3cuYaJ0SKubi8ZSx+SPMEEJR3HYpp9r1/ozw+chUmNjbXiZ59BRHfrpjd+jbm7GJ39RuzGdXuUcK8vUuhvyODrwdGs9oPSgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KWg6t8VP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KWg6t8VP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B891F000E9;
	Fri,  3 Jul 2026 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783074650;
	bh=EryfTCabHyfAsgBeoZYukfHyHPumJaSiqNuKBOOvBRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWg6t8VPLdECJv1eJ82XCarU/FYhebJO091WlbvHZSqY2HH/98Bv6pauCwWm33NHq
	 I81LCPtro6pgZQ9Potaw5V20CAsXSD0rWfggO/wIbn90WQUpaYyh8wru+uXmMQZjVC
	 B7iU0Cbbzpd+7Ea9wxPw0RGJYKFcq4rQISMHoAvw=
Date: Fri, 3 Jul 2026 12:31:00 +0200
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
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] rust: id_pool: add contiguous area allocation
Message-ID: <2026070334-dollar-hexagram-e49c@gregkh>
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com>
 <20260703-chid-v1-3-84fe8259e46e@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-chid-v1-3-84fe8259e46e@nvidia.com>

On Fri, Jul 03, 2026 at 07:16:06PM +0900, Eliot Courtney wrote:
> Add support for contiguous area allocation. Add a new type,
> `UnusedArea`, following the same pattern as `UnusedId`.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Why isn't the built-in idr library being used here instead of rolling
your own data structure?

thanks,

greg k-h
