Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420458FD26;
	Wed,  9 Sep 2026 21:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988267; cv=none; b=J/gUIp38XqGb78ket+PaxHUYlQi2xeacWC6U3OwS/RWfMTdV+JUT1VKJH3bD0NA+TsEicQgfyua6qnIqJ1d09T8jW+j+EyL0vjSdQREHrgSUR+DfmxuWfIO+FH0UgcuYdqyVxs+qj8N5CbtEPMTR1O1Di+YvP/nZamlBRaftIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988267; c=relaxed/simple;
	bh=sJw319V3qv+1Dfrao12AKkohQCAzVeu6BFVDExsIeZA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=iz7zKfiOmXOKkAqpuqjp0oHSFo3GX2aDtgS5NUr3/bJksQjTrT2hzWt+do2DKLN+sJmeO7XbiINwfpe+ncyJ7lHjGNUlAPnG3TKV31jAuey58a6UfJBuGW1fQMQVurPmuovGk3ELlwvP9QHakpUYAtNaH8mgCFPMTM0L/vv9/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juKp9hiW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juKp9hiW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E6A1F000FF;
	Wed,  9 Sep 2026 21:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788988266;
	bh=sJw319V3qv+1Dfrao12AKkohQCAzVeu6BFVDExsIeZA=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=juKp9hiW6y7Ll2x+QeUNc43LnJ0ZqrO3DSlYqxZbcbEUPhkyOnHUtNYyfYhsG6j6p
	 mdWiGjADlf22/f0/x03YZPY6O3rWe7qebua3+MbmacwVDmKkb/+sKf1qvpLxIwan0d
	 QVt1P/+XbTG4gPXogKTLiAQds681lAnEpRmhNBWOdgThlmkVbpXTi835JLgVvZAn93
	 xWCecp+KI5xlzLrFCRXdmPQjoYxSdaapZAFk/n6xMR6XZQm+7LECEsH5lrlPzq0dDD
	 hLyYlTvOqCJOmR1EQxMUHOGd3/PLAMHf0JI1tb9ltypRgNOpQC+yILo0yQjMB9Fdr3
	 1IaBHx3mCumrw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 23:11:02 +0200
Message-Id: <DLB3EU0DVC9B.1J5OLPMUZJBNE@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 00/16] gpu: nova-core: GPU page table, vmm, and bar1
 mapping
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
In-Reply-To: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>

On Wed Sep 9, 2026 at 5:59 AM CEST, Eliot Courtney wrote:
> I am reposting Joel Fernandes's original series [1]. The rebase adapts
> the patches to recent changes in the rust infra, like HRT lifetimes. It
> also adapts to the changes I posted in [2]. It keeps Joel's design and
> patch split.

I left a few comments that we really need to address. However, I'm fine if =
we do
that with subsequent patches. Thus, a bit hesitantly:

Acked-by: Danilo Krummrich <dakr@kernel.org>

Also note that eventually we want per-PT-page reference counts, so VM_BIND
ioctls can reserve for the whole range requested by userspace. We only know=
 at
job execution time which parts of the requested range are mapped already (e=
ither
already with or without the correct contents) and which page size is used. =
I.e.
we need quite some flexibility in the API to take the optimal decision at j=
ob
execution time. So, this together with a reclaim approach will probably be =
a
huge rework anyway.

Eliot, when you apply this, can you please fix up the nits, e.g. make the
imports use the correct kernel vertical style, etc.?

Thanks,
Danilo
