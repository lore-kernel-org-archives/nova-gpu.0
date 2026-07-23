Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559C3DAACB;
	Thu, 23 Jul 2026 23:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850123; cv=none; b=uLMf5gfP5agnLh8OKXhC6LrGrRFklHjeoy8B8yCKIGN17G502z6HEA0m7q7fp56/abmczuppppISdGrfAhARxx/tPo4ASs9jHvacBakvuamwo5eJGPYMbJ+kra5O0KRmOCuqKIDBKEmH+jaGBpEaj/j0uh7sl1U8Od7YHYoxbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850123; c=relaxed/simple;
	bh=Mayn871PRe1pifeQ8rBg4N/wfjGRFgjD+eK0paexWds=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lwZFWeguAkhpch/cUd+1efqIWoYIz7n/yESjZmr4uVlmuFA5Q653VwFVZ7na1Mofbw64hTU2FeugZZBAtWA3oQxO3fjpdE81ugvFMYpfejy1cZCrm0ailoLrp8KgSW3SRiSDRAp8v2MzrXT1+NV9riijMvMoTTokZ0tFhtMt788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INis+lHa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INis+lHa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9391F00A3A;
	Thu, 23 Jul 2026 23:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784850122;
	bh=Mayn871PRe1pifeQ8rBg4N/wfjGRFgjD+eK0paexWds=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=INis+lHaqMWELGoDpFEazhy1b3P5wOCSYmdydM/CdbCN7oHicXnkeZnKWmj58zuOh
	 rl3TYgS6YX0/4JZiZ12P23oztAuccoL6TDTP+uS8/MQatqymhRla7PE5s+fctMlgYh
	 9Y+EglWxuKVtVYcqTLMxbhR6y54eC4r0cwNZebC53hWupziZ+1VNefiW8wCHcNrgnL
	 Kqcaehy95A0+14UT786338AWwrrQ70NWDglkil0xF//PryEs+ApsixzcyKWpYFzDLR
	 snUCcRg+8UpAWsGuV/JHcw9JUNXdEkLvHVWmnEVStWUge/qZm5jIA15WOlW02q2zSm
	 w0TKsCUfLeDlQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 01:41:57 +0200
Message-Id: <DK6CK8OAMJB7.B7BWH6B6U8SR@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix packed registry table size
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260723-nova-registry-size-fix-v1-1-8f471ba00ab4@nvidia.com>
In-Reply-To: <20260723-nova-registry-size-fix-v1-1-8f471ba00ab4@nvidia.com>

On Thu Jul 23, 2026 at 8:54 AM CEST, Alexandre Courbot wrote:
> `PACKED_REGISTRY_TABLE::size` describes the entire table, including its
> fixed-size header. `SetRegistry` currently initializes it with only the
> variable payload length, omitting the 8 bytes header.
>
> Fix this by using `CommandToGsp::size` to obtain the actual command
> size, including its header.
>
> Fixes: 19b0a6e7c2be ("gpu: nova-core: gsp: Add SetRegistry command")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260722075253.B6DDB1F00A3D@smtp.kernel=
.org
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
