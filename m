Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FD219303;
	Tue,  2 Jun 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780403896; cv=none; b=kTa6G4rq57SoSbjCc1C3waqMgDuEUFrO5HsNtdrastapyYIbAPcebAslnviOhmenWB2m61DybztGC8BgdjNpe1zYTc8AlkekNdckA/04FcgaNuocBqEP77Cn65qQM0jukDv6RCEjJumS7oXe46LU87mjfttDh7oyz27VtpFZ7bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780403896; c=relaxed/simple;
	bh=AquQHuuj3h7HOwbS/VHS7QlnsLEejbNya7LtQky289E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=OdHqw/4N6ffG/KwYF1wvkpH4cO5RaU/dI490QJhhJudEywZNUMoDMuUi9YyTULP9BMqUQYMvntu1tUo9rsfJ/Y1OlOHzhjz0zSK4h9JKHcoMPOQqrP+MAEbqze7PRvfnTHlBcRwxsjZcpMQsPEQo9Ur4zLoeuAymPcUp9CgzpbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0PFy9sM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0PFy9sM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01811F00893;
	Tue,  2 Jun 2026 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780403894;
	bh=/tS3Huz/EEAgeCENhTA2f5SIhWedz2JMtDIAUjrspK4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=K0PFy9sMV5mqItyMAoK3uGhCa3Na4B6CQmax9mxd/FUrTJnOLUUpEToj8tOu52nrb
	 nlVGeaOvdmqgwSZ2pI/OWyNF8c07bUCVi81L65kS9sRGFZAif52PlSYzq3rEQPo44k
	 IumwGep0kApVA5SqxqcOZLJNDqMDCXcLCdJexdaQ5se7nMvW0nnPEnYIq6p185dQwx
	 RIBmwHUjT4GLXbqfQkRVX1Qc+/zqGh94EQIspRQ62zmhjs396LzCxajXrWJARC9+Yx
	 9Y0hoz7BzMV5boJYWdE98fXZdhJqjrlvSF1C4w/YMxcH1Ly7N06iEhObBA2NHNfwxD
	 LDwsV9FSX5BMw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 14:38:09 +0200
Message-Id: <DIYKI7EGOVNW.2TAJPPO4FY4RH@kernel.org>
Subject: Re: [PATCH v12 00/22] gpu: nova-core: firmware: Hopper/Blackwell
 support
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>

On Tue Jun 2, 2026 at 5:20 AM CEST, John Hubbard wrote:
> * Made the FSP messaging path sound. The FSP falcon's EMEM window is a
>   stateful register pair (program an offset, then touch the data
>   register), so modeling it as a stateless I/O region let aliasing
>   accesses corrupt each other's offset with no unsafe at the call site.

It's not really that the problem was unsoundness, there was no Sync require=
ment
in the first place as the type never left probe(). Once it'd have gotten a =
Sync
requirement, we'd have to use a lock to protect it.

>   The EMEM accessors and the send/receive helpers now take &mut self, so
>   the falcon handle is the exclusive token for an in-flight exchange,

Once this will be used from a concurrent context, it will need a lock as we=
ll in
order to perform a mutable borrow.

So, it is not that one approach fundamentally works in a concurrent context=
 and
the other doesn't.

It's more that the I/O backend approach did turn out to not add value
considering the implementation details (auto-increment streaming pattern) o=
f the
EMEM window and how it is actually used (no random field access).
