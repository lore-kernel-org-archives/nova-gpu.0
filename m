Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066179;
	b=PiRGBKAiN+iGrcKBHc4c04d9qn0kn6WrmrVKX/OEQbvwYihyddQQ9PsC1RLi5maX7xQ2
	 Z4YHPZJJdlAjXpgAA40zUefbFIbb+VN5mDgfurNf6CLjUlrYcgC6pMcrnz68mstPnuTbd
	 AlNpbT3IaXrU8J5kOY77zu94MZzF3Mei00JJvQogAvSEAmDVaerJ1iN0p5tT9tQbHNS2J
	 RgEwKfCfY6WU1k5PPyFU0CXIAOb53Y+shKbTAuqlS4LgOfptS8m+yZoQ8XiWKXzoD3t98
	 xx98rJ7do9gnbDuCN9e00/fCgVapoiriMTfDj4lQIMiOVt7QXxRW7sWG+d0Eg3PT4nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
	b=i2DaGHsbij5/m3rvVo2+C3+Evpp14dVo2PDUz9QWgP6BCFcvZgr1etytPXVWPxge3qbG
	 eHPFH2BiTQZDx9ovbPmHj6yB6Vj4bKTl4c52Q1hKsn3BkwnXye0QSEIKXkO4nzJqjU95G
	 VFrSvPnyhC2zbRBfj+J+RVAIy9OI9eJ3B2TTqJH7tVBKZQGWkr658GqVs+L3eiWwiLZLA
	 U1CLbcQgBLrQNAVdpHld9hmMhBmI1aHWkVGDXGdtnm7vnpdGt360NTDWSvnCvqwvTFX6z
	 j/APx58yGIkzpmsF+Pu2NPsaQySimfjNPIo7tyyyWbUnrYjyQKLdNZxlZvvDAAAL2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AjZu6GUM;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9487606A32C
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 15:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9487606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AjZu6GUM
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490ab0a20ebso1158763f8f.1
        for <nova-gpu@lists.linux.dev>; Sat, 07 Nov 2026 07:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794066177; x=1794670977; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
        b=AjZu6GUMPuyTGmdpaJWNXLuSudH5gvLaj0GEzLoMbX0evn27ngQqniF6HFyOMMmDUC
         jYcurnum+eClnphyrQxmg+8GiFPUqs2Bm0U0L/96RHeU2y4eyIt0vniW7ZBCZwQO2fUJ
         OgXJX15+6cSffMk3SptDqSr+ImJy8mLHVhyLwiJzwE3B9WJnkex8wWN5frAqOkrfy3IU
         ZWAd/RiD7/rxvK44CdBgQN9v/ipebNl3XdpP1pniU+bue5t98bxTgrJXEScn5TQsW+xU
         TclyNhTFs+YViCBsml+eNK71wE4T6Ved66Tjk1p/oBFgibmgDR1EDWlM0TGomE1bFqvO
         iO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794066177; x=1794670977;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EggZBsns3+rf0UaTI6t/NW4lmqRaDYkATIDcO9ZRpSM=;
        b=yPpXBMTFESEqTe6XM0MzdIURCOn1AZv8HaZkZEmlXX/HpEj3UX2jkMaLRNu7CVFV/K
         WhiUbDSUrU9UQoene5343ka4XhEvhtsvsAE8mJmJkMG7xSjIcqsYelDriEmCFX1fRmec
         KxmWASX8Oug4BWx2RPINpEuO6/yD5usjF43dCiMjheuALAAf2c4shbGDWnMQzTsX78yW
         RC9rChnmct8mim+LG84RtqOhIPn8xyuSnvyR0M8P286/EX3EFWv6EDiBmGyAeIP2Pm0c
         nSfcIy3mNyd5aYjghAlj9fak5GvG5eQIeOMRcUYp51QcwM5EFjoKqS8+nxArFAxV+CvT
         b1rg==
X-Forwarded-Encrypted: i=1; AKwUvBw03lnVzWfUf210sz746w/QsMYephDzFkqIXGbc52DB/drtctq8H8OJUzX6I4Q2Ip6iBrd+SXZQNQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/5unxUhZrXRHRo7+dnDtJD13BPxPiie41khOa4eLckcfSOXcmf
	8++HXKUpmX7tfVTgfT0n/8MmQfhaI3S5DqL32CN85/jDOuFVaQD6Jc2W5y5YkyNi/0HaKB687IP
	3DEk1yJw27eDdmK9CBw==
X-Received: from wmri27-n1.prod.google.com ([2002:a05:600c:8a1b:10b0:4a3:5dec:ff72])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e0e:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4b6df7d4a32mr98531565e9.26.1794066177054;
 Sat, 07 Nov 2026 07:42:57 -0800 (PST)
Date: Sat,  7 Nov 2026 15:42:55 +0000
In-Reply-To: <DMOZR1THYXEZ.138HB6J6HIMFK@nvidia.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-1-67de9180b4ed@nvidia.com>
 <DMOZR1THYXEZ.138HB6J6HIMFK@nvidia.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261107154255.3547388-1-aliceryhl@google.com>
Subject: Re: [PATCH v10 1/3] rust: use Alignment size constants
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 07, 2026 at 09:52:13PM +0900, Alexandre Courbot wrote:
> On Mon Oct 19, 2026 at 1:29 PM JST, Eliot Courtney wrote:
> > Use `SizeConstants` for Alignment that are implemented now.
> >
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> Danilo, Alice: could we get an ack for the buddy and io parts, in order
> to push this series through drm-rust-next?

I'll defer to Danilo on the splitting up question. The change itself
LGTM and I'm fine with merging code related to this through
drm-rust-next.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
