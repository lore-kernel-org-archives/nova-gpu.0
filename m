Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8E131C56D;
	Thu, 13 Aug 2026 22:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660638; cv=none; b=Ch9iyVbaEPQW3L/Eg5XioET59PIzVe6zZmpidaxMfQ/q5vOsQeBnJzkzlHbR3Qf++paUfDiRsMwSxw/4zGFGhnnZP+mcGr1W2Gjj8+HY5UHJEpFpz8Cz8FKJ7xsHaWrDT3Dm0Ue/91g9Fufsl6B1x3oyFp6G44w92QvoMjqunKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660638; c=relaxed/simple;
	bh=x0sBHh/QP2i2x6xoVI04PeL20D03zh6z6U1yRQzKL0U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dDaKr7vZHfWo9lsg0V56H0iZmPBnAvBSnIWRxN3OZDwYhDp0T6tla/uT8bJ8a0MENXI/Ob4VSf4AhyohAvvZsTiPGculbMkmg/dyS0PsmbSvQF7t6VtoA3Rt+AKpBZkiaAIvHtogL7kD9Qvzf8z2V9lxFUydMuw54o4OU0e97FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeMgMyW7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeMgMyW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFEF1F000E9;
	Thu, 13 Aug 2026 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786660636;
	bh=x0sBHh/QP2i2x6xoVI04PeL20D03zh6z6U1yRQzKL0U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=CeMgMyW7jEz9N7xRvZw7ADryf4+pOsgqMRGp27oXP7iL4J9kyWFcvcmvT7zZej8JN
	 19wn/6NI6hRe0O+fYaB7PSodl8JfCmC/u2y9aGwlAD0p5aUJFmznVOPJNPJboJcH+y
	 YWxSNH5x/sGfp4Jk6XNvhxSHZ4AlsAebyZ8hMdAFjYzRYq6c2i4IYovzHq0YM0sArt
	 U7mSinAKfYUOQ0uqsvJk28V6QFJi1/24S4mURM1Je+UEsqUrvKUoGUA6WdCTsL/uSb
	 DHZEdP2Knb6+bFMu6kkLfuffxBXTbMKhT5KX/CLduOALVcS7PyqqYh30braPjeGfBb
	 +Rb9wwMz11OCg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 00:37:11 +0200
Message-Id: <DKO6C2WX7ZRP.XRU16IG7PD5I@kernel.org>
Subject: Re: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during
 probe
Cc: "Joel Fernandes" <joel@joelfernandes.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-5-jhubbard@nvidia.com>
 <DKO4XKBWD8W5.1K2R6QLREBJVG@kernel.org>
 <57d116ec-3288-490e-8b1f-480a87f1fa9f@nvidia.com>
 <DKO63NHZUU47.27B9TJ6B1FB8N@kernel.org>
 <39b44d64-928e-4d65-81d5-a06809233c99@nvidia.com>
In-Reply-To: <39b44d64-928e-4d65-81d5-a06809233c99@nvidia.com>

On Fri Aug 14, 2026 at 12:29 AM CEST, John Hubbard wrote:
> On 8/13/26 3:26 PM, Danilo Krummrich wrote:
>> On Thu Aug 13, 2026 at 11:43 PM CEST, John Hubbard wrote:
>>> On 8/13/26 2:31 PM, Danilo Krummrich wrote:
>>>> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
> ...
>>>> I was about to ask if we really need to bother with MSI and shouln't j=
ust go for
>>>> MSI-X only.
>>>
>>> I have an expensive, recent motherboard in my test machine, and it seem=
s to only
>>> expose MSI for my Turing, Ampere and Blackwell GPUs, in the non-SRIOV c=
onfiguration.
>>> So I'm thinking that MSI-X only would not work.
>>=20
>> Interesting, I just checked one of my Ada and one of my Ampere GPUs and =
neither
>> reports MSI-X in the capabilities. Other devices show up with MSI-X thou=
gh...
>>=20
>> Are we sure it's not an endpoint limitation? I really thought it's not.
>
> I haven't really dug into it, because it seems very clear that regardless
> of the answer, we need to support both MSI and MSI-X in nova-core, right?

Apparently we do, and I'm a bit surprised by that. But it would still be
interesting to know what's the constraint, as this seems to be an endpoint
limitation. IOW, how can I exercise the MSI-X code?

>>>> But then saw that the commit message mentions broken VFIO setups; can =
you expand
>>>> on this a bit? Which setups is the commit message referring to?
>>>
>>> On Zhi Wang's Big Branch of Everything, he is able to run Windows guest=
s in a
>>> vGPU VM on top of nova-core. That system requires MSI-X. And I broke it=
 with
>>> an earlier internal version of this patchset.
>>>
>>> That information probably leaked into my commit message here. I can rem=
ove
>>> it. Because I don't think it is based on anything else.
>>=20
>> So I guess we can also drop the INTx fallback? AFAIK SR-IOV VFs won't wo=
rk with
>> INTx anyway.
>>=20
> We could drop it. It's there mainly on General Principles, not because to=
day's
> GPUs use it.
