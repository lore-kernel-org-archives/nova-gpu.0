Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6EE424666;
	Thu, 16 Jul 2026 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210542; cv=none; b=CWSm8yny6xGEJsX/UaHsh4ipu7y2MiWn6XYf8vRGxXYGJVmEUIEjvc2ZIp+ICQMLAiZYcfzMkINxWF7Fr6yKW5K53gy7lyJiAnjhiwqqCLHWOVyR765QkbN8/VTIyS+ROkjJ5/lNK1+SsWKLyiiLVZHXj+LA3gv1YVnH7/M7c9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210542; c=relaxed/simple;
	bh=BGlHcfZW7yB91Xa08RonUxe8Go/HQx88wWlDY0OQmp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rzr6lbZFcJLo41QVAr5Waa0g4oXnfWlpL9+zh3c8Ht5OvUHuBgbniXzxb2s9AAzrpLxma391Z1X0CpFNJaJBOePCQa7fZnqQkTJrADbagUuK15NP4FEb3S4MUnu57SLxUMNaSWFO3ZSx2Dd/vjhFSxTUQ+2Fjlw8yrK7QY5Broo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Cl/wl1+M; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Cl/wl1+M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Yw0qM4Vl6ROJvhog0C+oQL24gbChejWRt36l3chQZbM=; b=Cl/wl1+MgZhok8096gtrdntDpt
	8ErM4TVKXRHc1qtPOoeKk26yYhJKxsdrznzzOZv/FbtgdbAWO+bDSeO7mXrcEE+bWkjkm6ICE5hBo
	PbZdfWZ5Fn4xv8IHkt30L1eKNU22DeVQXgut74yui9pSxvTcyVa/LaiUgporSJn9w68dWLN+fXzcV
	qe9KyI6G9vAP+fKHJnMyKkLGIxgAdtHhFomSMoc9DZe/9TJTtr0J0HCut9ub4SAePa+Zew9qj+No4
	7DEzwTaf0YXRy9/P1/+iAHJUm9oEz2RT0veCn6sV7VWtSjRqlreO35JWWJvma9K7mxBJ1pR+O0zXL
	/FEognJA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMf6-00000002dWs-1Zg2;
	Thu, 16 Jul 2026 14:02:04 +0000
Date: Thu, 16 Jul 2026 15:02:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: Pedro Falcato <pfalcato@suse.de>, Eliot Courtney <ecourtney@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>, Burak Emir <bqe@google.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Simona Vetter <simona@ffwll.ch>,
	Tamir Duberstein <tamird@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>,
	Zhi Wang <zhiw@nvidia.com>, maple-tree@lists.infradead.org,
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] lib: test bitmap vs IDA vs Maple Tree performance for
 region allocations
Message-ID: <aljkXMNLkciazVVi@casper.infradead.org>
References: <20260711063602.426311-1-ynorov@nvidia.com>
 <alf1lUH0EDf3CRMl@pedro-suse.lan>
 <algrZLHyYcR2mwzX@yury>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <algrZLHyYcR2mwzX@yury>

On Wed, Jul 15, 2026 at 08:52:52PM -0400, Yury Norov wrote:
> The test is very well motivated by that discussion. I'm not saying
> it compares apples to apples. I'm trying to quantify the answer to a
> very specific question: what is better for NOVA ID allocator. Or more
> broadly: what's the best data structure for range ID allocators of a
> given capacity.

From my work with the IDA, there are definitely ID allocators which
allocate only a single ID, less than ten or less than a hundred.  Could
you scale the benchmark down to 10 and 100 rather than starting at 1000?
