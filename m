Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F936F434;
	Mon, 24 Aug 2026 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600100; cv=none; b=YJVBd3ahQTYdsIs2Ie4j+KJsKV5J1GMiZBfINmRZTGsWk+AH8qjgwjDXbNXdZXcu1faFka+5dz5nI5vr+LHJifjYgtHXiucfHZk7eYFT6o7Qg3O/o0ElWO1BtBQYNGPOPS2jo1Qj0HbNHBzz66vCQPzFd+q9l1oea/JI5Ug5Jg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600100; c=relaxed/simple;
	bh=MZTVmQ7WGhxvzxBre+8AkW8zSErm8lmepRmjgP1Vels=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HREFYYHfNf8fTBrMPx2ciZHBr2XM9TEcJQMGRh1LGNxPpHlA32XlIUz9TgjjVcll9KZBJKGKU7c/ClvUFzsF68xJ46h5B1+czJmMtkcS2RiNBZx57wcIPlRSz8hH+f9B51uWiKh8BD0qwAerujJmLjvFehPROJ6XhKWHszuvBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4W2HNCG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4W2HNCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDA91F00A3A;
	Mon, 24 Aug 2026 19:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787600099;
	bh=M3z8xXoUo6x2nI4A38ePuDoTy/O0zxphQa3MwxelIRM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=U4W2HNCGTwnrMGY6kjL9RMAaw1dbXpfkdFuN+Lx8rQMPjTQVtG1tx5ijguR2xJqLT
	 HWzd5SF47GMjriJ285nqc0ky956TiMw7K/EiMo3pmhpSscsMrzYMZjVvMT0nAUL/sY
	 zcVeMgYvdxP+haDztlxoOGDyISseqYSg2RbvNWfzYacz7ZomegdjDJxdyJnD00aslM
	 kaZK4IvvNEyaDwT5M1lW8bu5T843J8KKtTWCOCOUx+ex5TGCmqlGRAHyQZAfvDP2a9
	 HtZDAKDoIxXNA7dbSIknAxj08HLr11Pa4hEzxykrys2uoJXRMwgSegsQwGZRuRWMZy
	 Uz+CjJQDbIdUQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 21:34:55 +0200
Message-Id: <DKXFCIT7WHBE.1MJV6UKAJ5VEU@kernel.org>
Subject: Re: [PATCH v4 4/7] drm: nova: Add a GPU info ioctl
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Benno Lossin" <lossin@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260811050657.646799-1-apopple@nvidia.com>
 <20260811050657.646799-5-apopple@nvidia.com>
In-Reply-To: <20260811050657.646799-5-apopple@nvidia.com>

On Tue Aug 11, 2026 at 7:06 AM CEST, Alistair Popple wrote:
>  include/uapi/drm/nova_drm.h    | 27 +++++++++++++++++++++++++++

Btw. I think it would be nice to have project to play around with and write
tests directly on top of the uAPI before we can run the big test suites.

When I implemented the VM_BIND uAPI for nouveau I used IGT for this (but di=
dn't
enjoy it too much). It turned out to be very useful to test and benchmark t=
he
implementation before being able to complete VK CTS.

When I sent the first nova-drm skeleton, I also submitted [1]; maybe we can
extend this further accordingly?

I'm also open for other ideas, but I'd really like to have something like t=
his
as we develop nova-drm.

[1] https://gitlab.freedesktop.org/dakr/drm-test
