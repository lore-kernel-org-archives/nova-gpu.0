Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411842;
	b=FSSoh02hiSMHN+FYsgvyEJ/UM+0MWMOmhKO28dz/63DdN/EWcGhvZGGWdL9CJetm5FUv
	 w4IZPHlCzAA5wSxG3UaVpvqvpL7YUSbPRJlPs3iIW8Zd9ZMBHb1GFCrGdBFak79Wrm7bg
	 PKgdAk9IOIEZkxajtciCjaWHAdqxWbUIHh6LFnsYc50wm2ypIvYkR8VFjY9RBpGddN/Sx
	 8FeGvQXJOFILI9ndd/u1Ph7ij7oJFiy6Z8yEf+hb5PWeY0SEKWGGmZx4zZ8Q4xyozGIx7
	 YN6YN4cb3cKQx8SMx9kI188PhI+EaXiGtTu9p+LddTODsOJOLn6dyhDCbpgfGncIDIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411842;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=ld4XtXK2SQe+LqDkNkGzQrapNgCtkHSKWE+dahSdXTg=;
	b=m1qB82dXt5qvWhm7pQnftuiCM6/08kzZ2b8ncZcLt8g29eXs9+xxChnjdW6ZuHKRZ0Cg
	 WND8tReXtoH2oJ4jnZGyER0TtfogH5PK/kGmujx/upYKvtujxJKkMNg4+18+SQsk3d7A9
	 w+ICM70BWw3zMrFNlkIdDPSMlHfGtCiEWeNO4mRNb7nU11WDXfpUbXMRJT2l87I81Rq85
	 JBYOIsd9GH4Al+eslP+5Ea2a23FdLpXHDUjn7HkNg/A7SMMnwYYIXbw+n9uHVE7Nyd0O4
	 Ubbf6YnLb+sXs42UMj8aGiedAl9Op9xGelVDnBHge9XKkTwT8VAlA2nECcQ78+grsiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DeH+Fv5m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE9606A326;
	Wed, 11 Nov 2026 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DeH+Fv5m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18B81F00A05;
	Wed, 11 Nov 2026 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794411842;
	bh=ld4XtXK2SQe+LqDkNkGzQrapNgCtkHSKWE+dahSdXTg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DeH+Fv5mAMeLLg/J+R9mfE7F4/t0xvH8wO6g2P7seRNnqSJIpTnX/oASqbOQ/+dD1
	 SA2LMDjRVaXwN/K5z6Q3+BsgXMUBtWa7BPQOw9K7P3UnzPD2GTODEuvgKTFtQ9oMs/
	 j/kk53uAet017VgJ9rNq7XGTOn9h9MolMaWGGyWYbkV/daEGTrUwS4euT0BYHUQhZb
	 /tK3eoRGLWn27cGr+ElPot9GR6bh1xwpToBtNf+BDSYxv5Hk6uYQyGo2L071WEbswQ
	 1P1uyNzoAWVhMUDD+5DnojfwjgRYnI/lF4Ztqfr4QUj/E1M77mSg3OpxKhCpluwl6G
	 bRXhBmWlgsrAw==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 16:43:58 +0100
Message-Id: <DMSHWQDVXVD5.H1UNOAA8I6XB@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use pin-init self-referential support
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <lossin@kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261110152746.140351-1-dakr@kernel.org>
 <DMSCIQ1NOV15.383LSC2I0TMON@garyguo.net>
In-Reply-To: <DMSCIQ1NOV15.383LSC2I0TMON@garyguo.net>

On Wed Nov 11, 2026 at 12:30 PM CET, Gary Guo wrote:
> From the changes made related to GspSubtree and other types I think I'm m=
ore
> inclined to just make `Cmdq` lifetime covariant using existential lifetim=
es.

Hm...this would also get us rid of the need for the existential lifetime bo=
und
on NovaCoreApi. At least for now.
