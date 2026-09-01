Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB8351C34;
	Tue,  1 Sep 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275346; cv=none; b=grrHd0zVf10RWZ2Ya0aoRkKnXN0kxOnX9P/SpvHUa0hRqP6vexMSdBut3qOhiSWF8SpSVKUlTiELHH5akMHaikRGpsUt4Ck3MFhpZEVuvqbOxXNn5aIV4MWtjMNEiy9ZFMWzBm6/PrDAvxwEVIHkbCzxocEjPlbPwn9YPwsaF+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275346; c=relaxed/simple;
	bh=kyYnvCmiiLffQffcLYkPv24a9EvjbMWuIoe8mJRiZfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnbQB5ZVyj3LjeHE7dzahg/0Pn1D5T/PN5B/cK8ijsVi20PdzBTr60pRLiVnNGJxnoHEKYIQ3zKoSkSsSi9ZyOlW7snCFF/g4PmsZ4FyjzbsnhWQ0yoxc16mhmQcRuISWj3vIogfm2oi4PVvE//ojAd62nR243Ol3wGqF5p4G2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilcx0MIP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilcx0MIP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98731F000E9;
	Tue,  1 Sep 2026 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275345;
	bh=t7FplDsBfmGl/gAACEaadNUtKYyyTY4EUi0ytlAdFzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ilcx0MIPCbhFA9kjrg9NuXfheK2oR1chTdHWTQIMspYVFU8Ui1uQwSIUp+NyAvHGf
	 9lysAvW76P5gerCpJF2DCsictugKuvCf9xeLXgzUgAchue5K7XxG4AS0otJY7KPCeu
	 UDviLDqpibVsG2yf8A2j00NuoPyIy63H9IG1iJWIiySP5XsM2re9E3Rns5yBgxLJVR
	 A3loWb4MoucNwBNXInYCyPmygtgi3tuKtKsySg77YB7DouR/JVUzYAD+vzjcHXpH0v
	 4Gv6GtyWJ70gLuzYnhlEXZR/p0aiNQPXt6X/DCubHtO8ECYHJnUIcPsAAVsNFUkQ5/
	 aYsNMhPQSvKeQ==
Message-ID: <7544ae6e-3799-4471-9622-b8a1150a571e@kernel.org>
Date: Tue, 1 Sep 2026 17:08:59 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] gpu: nova-core: drive GSP events with the SWGEN0
 interrupt
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Will Pierce <wpierce@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-17-jhubbard@nvidia.com>
 <DL42E2ZJ3I44.1KOMPGIKIJY5S@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DL42E2ZJ3I44.1KOMPGIKIJY5S@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 4:54 PM, Alexandre Courbot wrote:
>> +/// Threaded IRQ handler for the GSP SWGEN0 event.
>> +///
>> +/// The top half clears the GIN leaf and reads the falcon SWGEN0 latch. The IRQ thread drains the
>> +/// GSP-to-CPU message queue, which takes the command-queue lock.
>> +#[pin_data]
>> +pub(crate) struct GspInterrupt<'a> {
>> +    /// Borrowed BAR0, for falcon register access from interrupt context.
>> +    bar: Bar0<'a>,
>> +    /// The GSP command queue, drained by the IRQ thread.
>> +    cmdq: Arc<Cmdq>,
> 
> As mentioned above, I strongly suspect this can be a `&'a Cmdq`. Which
> would be great as it would make the whole `Arc` refactoring unnecessary.
Yeah, this does not need a reference count, let's not introduce them where
we don't actually need them.

Thanks,
Danilo
