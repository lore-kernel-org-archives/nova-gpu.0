Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C35D3859DC;
	Mon, 25 May 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779719345; cv=none; b=gD7s4CnbjEf60DuEnIIBHdVSBjeIwcnY2r81laZOh0ndCdAvu/1cVqeGvB+H84X9Y+VLCAVrt1gRa+ltbaglk041mBH4wYhtUyaInB87H/KOSdbgBxQHAk5Hnz82Saptr2WNEo8KlgF74aiCDhMWeDp8v+21dW9Lizg6kZbagrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779719345; c=relaxed/simple;
	bh=wX3BKgXLvoKEc9ImDczn26rA5fMJk+gQjuiHhVBqb8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omyqQZoU667srG5+RohuVAkMjjLTmapOW34v5aowuQYURO0EyhbIxr4bhRvEK44zH2P01YHnP9jXrxtSiPCmGoZlEhtP95jDxfIpCQjVRH02B1ylYh/c+KtX21Jp3I3QD0D/Nv3Qbg1yJ9rweugWWn1EqkQ6UXMfhTJEkLgcBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLuxFYtN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLuxFYtN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96FA1F000E9;
	Mon, 25 May 2026 14:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779719344;
	bh=gLQfWj4gdS8xSt0BpG9N75xejRxZ4FgzKtxYXBxvJyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nLuxFYtNIA16UrSbLesoOp17PKiIIfGRP4fZ3nKpcEGXRtYdLjzLu+eal8yi8snSm
	 45nM/v+A8CKfz77f7Dp1Gv4YzCN8kZGfC+zeSrInULiDceGnwD/3cHJpVRRwKRcYC/
	 zed1Jlja3xHGsfoev8/WYcYlEj8Y2HwWzCxRtQ0Hx6fC9U6fnH7QaIslL+q4fKpLlg
	 DPioLXpMA6gHyI+yMIuxMPu2NgpKKaF/yoUU5EFXAxlj7hXdUYyFlKKogfjCZ7qwXj
	 Xlyp5MDp2RHohsMr17eeKj9nqGMkBipMrxZLvcSHHSvpJrjcgLNHf7wbjbjHhdwupI
	 J3GwdRMBkhAvQ==
Message-ID: <f2e3e7e6-3e6c-4a1b-aba5-9be0c41e5c6b@kernel.org>
Date: Mon, 25 May 2026 16:29:00 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/22] gpu: nova-core: vbios: store PMU lookup entries
 in a KVVec
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot
 <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
 <20260525-fix-vbios-v5-13-e5e455251537@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260525-fix-vbios-v5-13-e5e455251537@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/25/26 3:57 PM, Eliot Courtney wrote:
> -    table_data: KVec<u8>,
> +    entries: KVVec<PmuLookupTableEntry>,
Here an in at least one other place the patch series changes kmalloc() to
kvmalloc(). Do we really expect this to potentially exceed KMALLOC_MAX_SIZE?
