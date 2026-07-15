Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B93D5236
	for <nova-gpu@lists.linux.dev>; Wed, 15 Jul 2026 21:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151669; cv=none; b=EACuxJSpaYtLgDYF1b1dD4NoRunLD0aqqlfeRAyRMpdhQVUKa01MvktEfDQJnnD6GFAety4D+sS2fWZ82TlfdP1tzFtmgDxPvE9EbmJ8wGpz+XVjGDTdzU7YAlneHOA+mwgSwRa7n5qfVTui3SfkeNGf0ySh4xukfpda32hG4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151669; c=relaxed/simple;
	bh=I+VyJPjAnkb6/HqGVmSLpXq3WBVmsr/02oVVRve61h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL4AC8or0Tt3c8Hp7SP86j6t2cWR75EubotK+Ch6FFX8TrwvtNfhFCO9Fu4u+KPFNKQaSIvxh50AgaTRuUz2emUJ5zTUOgAutrNv50RaL8Nxv1mju7vFr9AOCuwl1C3GKx0irhcwXtFkmbW25WmPKLAoHMpi+dkhAiv1ZwCsJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UQfi+QEH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9V3Zl+Vr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FkbjKIrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tAp/8rqL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UQfi+QEH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9V3Zl+Vr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FkbjKIrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tAp/8rqL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F06483E33;
	Wed, 15 Jul 2026 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784151666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yYMKplsCkgS/AgLoG7aspJHYLX0DgYIKmuJDfJKj+XI=;
	b=UQfi+QEHXnYWPHZus5KVQa5kmEvq+4jotF+eGbjyiYnFEmKxOF4WQOOSAodzuA1XDVlrei
	ClluRDvLnJ9epgPd/w2JVLEmWHGwir9f//2KXL7cK9Wr30ptd7qVv/Br6qbHpZ0RLWFNBR
	0kZ19PcXyaFg1adKVrh7VbTkDO1xSx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784151666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yYMKplsCkgS/AgLoG7aspJHYLX0DgYIKmuJDfJKj+XI=;
	b=9V3Zl+Vrvvjfsi7HybGde6vSyz8L0OlELcI33IJmbwmkDbMebH8Tb0WI/mugwnHWj4vxkK
	DOcK9MJaUoVrhrBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784151665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yYMKplsCkgS/AgLoG7aspJHYLX0DgYIKmuJDfJKj+XI=;
	b=FkbjKIrSBNYrrrKfZ1aju1sQOlBhHzR3cAqpKZQAbdMgo8KSjqP60nmT7I6fnMjFt7GSGw
	mJ0xhXXwzoFQQs7+wMf/Nv1ceyp9d8yJau7A6EAGVkspS+53a+EwOKgQrrwzj724+LU+Tx
	TfKFB6e39YYvBj0+VcwQpzD1xaHY+BQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784151665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yYMKplsCkgS/AgLoG7aspJHYLX0DgYIKmuJDfJKj+XI=;
	b=tAp/8rqLVWiKjDyjyu3wrOHjervyUuCazr/dg87LPi5g3QxP253MkMOFgFCxkS6l2eCU8J
	YZcwTFqQMjpAbqBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DED92779AD;
	Wed, 15 Jul 2026 21:41:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +Ii7Mm7+V2o4cQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 15 Jul 2026 21:41:02 +0000
Date: Wed, 15 Jul 2026 22:41:01 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Yury Norov <ynorov@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Burak Emir <bqe@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Simona Vetter <simona@ffwll.ch>, 
	Tamir Duberstein <tamird@kernel.org>, Timur Tabi <ttabi@nvidia.com>, Trevor Gross <tmgross@umich.edu>, 
	Yury Norov <yury.norov@gmail.com>, Zhi Wang <zhiw@nvidia.com>, maple-tree@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] lib: test bitmap vs IDA vs Maple Tree performance for
 region allocations
Message-ID: <alf1lUH0EDf3CRMl@pedro-suse.lan>
References: <20260711063602.426311-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711063602.426311-1-ynorov@nvidia.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLq475o4sqxnbi6ha6okxtmkb4)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,linuxfoundation.org,google.com,infradead.org,gmail.com,kernel.org,protonmail.com,collabora.com,garyguo.net,onurozkan.dev,ffwll.ch,umich.edu,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pedro-suse.lan:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Sat, Jul 11, 2026 at 02:36:01AM -0400, Yury Norov wrote:
> Compare the cost of allocating and freeing variable-sized regions using
> a bitmap, IDA and a Maple Tree. All implementations process the same
> randomly generated sequence of region sizes, ranging from 1 to 32 entries,
> until the configured capacity is exhausted.
> 
> Run the benchmark at several capacities to show how the approaches
> scale. Report allocation and free times separately because bitmap,
> IDA and Maple Tree removal have substantially different costs.
> 
> On x86/kvm, the output example is:
> 
> type       alloc (ns)      free (ns)   capacity   memory (B)
> bitmap      179573071         342105    1000000       125000
> IDA          46555636       33931498    1000000       134864
> maple        18629665       19741396    1000000      1548304
> bitmap        1630912          30933     100000        12504
> IDA           6144785        3354590     100000        14288
> maple         1745026        1825032     100000       155408
> bitmap          28448           3374      10000         1256
> IDA            418978         333641      10000         1872
> maple          185398         211138      10000        15632
> bitmap           2253            610       1000          128
> IDA             42755          36432       1000          144
> maple           19728          23474       1000         1552
> 

I don't understand the comparison. bitmap, IDA and maple are
completely different data structures for completely different purposes.

1) IDA is 16 bytes when empty, maple is 16 bytes when empty, bitmap
is $size bytes
2) bitmap is statically sized, IDA and maple have to deal with actual
allocation and freeing of memory
3) xarray and maple (especially maple) are optimized for RCU usage and
have different tradeoffs
4) IDA does not support ranges
5) xarray (the underlying data structure for IDA) does not support ranges
in any optimal way
6) maple is not optimized for 1-sized ranges, nor ID allocation; it
actually stores data, so instead of 1 bit per index you get 8 whole
bytes.
7) maple and IDA both handle locking implicitly

There are also other pressing questions about the benchmark itself:
it's pretty much the ideal scenario for bitmap. doing the find in
bitmap is essentially testing how far the CPU can speculate, and how
large the cache is. It's pretty darn large on modern hardware. Since you
never actually free the ranges in any way, every bitmap branch should predict
extremely well. Fragmentation in the bitmap can very quickly turn into a
nightmare, while maple will eat it up just fine.

These are very different data structures and picking between them requires
understanding all the tradeoffs. I don't think this benchmark helps with
that.

-- 
Pedro
