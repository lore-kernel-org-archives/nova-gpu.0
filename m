Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039387;
	b=yAIhm2P55jFTArasw+T5D5QhgxD3qnII+Lr/Uq0omZHRmvX7jA/IknNgstdrSR9PaC+t
	 sZsZyqkUbX0fB1UR1a7ZE0VFzxhZIMDZ9xXwDDJjaim3N24xtSf/HrzHICyFervjJxMHo
	 WKqx81N8+LwFcz7RbrPEAmOWV6AJ7+nT3f8VDgAY96w1oaXYT9xlwGla24PVmNI5hPLH/
	 rBxQaGGRPJExpzaHfSjupue5Prr+7K0TnKiUGUaJR3qwTd9lP04MboknJDvleiI/7QwXR
	 MGpiwH8NbU/WA7xZR9+0gihXrbbSMGux3FOrI3r6k+qgNmiHHc/etI2iGBg9c2vhkwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
	b=brk5MplQvGm+oagk8wp2PvlrKQK8mIA3PbON+vFBhsAFtdjMAW8aUgQSFyCJjKcehTgM
	 HEse587CWnunluWOTBDPrt2cSnCLJEI6Ungb5glAjqpWfLxTLoGgnAvojBIJMnHUXMhDO
	 9ReujS3xa1Xi6h4pzBS/XKFXwQ2nUja2w8RmKu3YFji8R/69VkTGzGUFRlr4j1rJykSrq
	 hShmsfl3zzbNn1jq6G8++W4weecGRcnt6RYyrsie9YSrS2fIGqdQbae45u61nrLbLsjIB
	 amrqhD/Me1m+acaiYdSjpfim3VVn5LnMQnYMcUkkmTSxAWQXpD5T7zSczgfjo2vwh3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=km2QIMvw;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AB606A32D
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 08:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0AB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=km2QIMvw
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0461e040so1149702f8f.0
        for <nova-gpu@lists.linux.dev>; Sat, 07 Nov 2026 00:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794039385; x=1794644185; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
        b=km2QIMvw097Cykog1LJ9qdCXkssO1TLy3ftUJ8d69StaV5zyAApWBWWlBSy6YWyDCk
         i8Ep0PuNqzwVy22W0AOgbQdZ+w0HiSv/yyT3uX7xG7iQjSJXIA1bp+wAF9ao1F3HOzMX
         BleBdQVQpzxKR9XI2QEGkOsoTSDpgHs+Iw7DLlp3F0UiSzjk1d8dmRWbkBwBw4Mg6/Lg
         e2/egEaHyIs5/xb7D8sl7CKvOjCNZyV07zoH0umg25pPKR0rUh6Dxru3+SU3KqPby5in
         OSHeOBjF/t8IUOuqjNvCmJWdpJx4rmbkyQFd2rkeSZ9P22RTTkgRlPV5HqvQVTXXG04P
         wiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039385; x=1794644185;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
        b=UQuUKc/QXwjEIUDRr9w08HgvlLTk5s/WlJlrVyAsqXPTaQT8xsN/l6CR95HGByrMhK
         hgLlnf3YJntWunk/091ynS5Vsn9GgkZx/slqNs1XUOYpFQBYlBY2LiaD4xRoBXD6mUTP
         UHdSoa3Axds19IxOafSbJaoAxsxDrfeCubKydkz9YwjWuuXqOZN8OVIJPDhRHTAQ1v3P
         +KH/AczSzgjBVmY2rIibVu8AT+XJFzXRGXrZS2HMEyuqsavc3RT8cymHgEGGjDeTj69B
         uGWL/kqfLCB2gk8oT55e+MhkjFYJMVfVWb4Uwx19H3XLnY67G0VBihykZ+VHxSYk3xkN
         09Pg==
X-Forwarded-Encrypted: i=1; AL+hErHnBs+16UlOTS1dEXV8nuqesuBa6A1KqoWJbR6wIkJ4r8a9Od7eD8TdnmUUCS/qIUwX97XBbZMsxQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8boWMtayuHN23EJqmJbkm96grm6huSBwnTN8lFduCl4Z9UiOAu
	17Z8BQNMazZTRzIP9y/yunXAx6zSQgSZeOo1ryuEqxd/qgeaMbN/3XGR01vAxWM2QNN/2Yyrmj6
	oyvewJtwFN7SqAmMY8Q==
X-Received: from wrtp5.prod.google.com ([2002:a5d:4e05:0:b0:48c:44a2:fe52])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25eb:b0:490:421f:1555 with SMTP id ffacd0b85a97d-49275b1bc23mr8281265f8f.22.1794039384637;
 Sat, 07 Nov 2026 00:16:24 -0800 (PST)
Date: Sat, 7 Nov 2026 08:16:23 +0000
In-Reply-To: <20261107021427.2105374-8-dakr@kernel.org>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261107021427.2105374-1-dakr@kernel.org> <20261107021427.2105374-8-dakr@kernel.org>
Message-ID: <au7eV0D_44ipe3mw@google.com>
Subject: Re: [PATCH v2 7/7] rust: drm: make Driver::File lifetime-parameterized
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, lyude@redhat.com, 
	j@jananu.net, alvin.sun@linux.dev, deborah.brouwer@collabora.com, 
	laura.nao@collabora.com, beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Nov 07, 2026 at 03:03:25AM +0100, Danilo Krummrich wrote:
> +        // Run driver destructors without `filelist_mutex`. Take each link before dropping its
> +        // allocation to avoid recursively dropping the entire chain.
> +        while let Some(mut data) = files {
> +            files = data.as_mut().project().next.take();
> +            drop(data);
> +            drm.open_count.fetch_sub(1, Release);
> +        }

Instead of transferring all the files to another linked list, how about
taking them off the file list one-by-one? If you release the mutex in
between dropping each file, then we still avoid deadlocks if the file
private data destructor takes the lock.

Alice
