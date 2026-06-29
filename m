Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B540D581;
	Mon, 29 Jun 2026 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733991; cv=none; b=YqY/nfrzzJaL/SIDTCwW1jDhjXan2B+gpWq2Q3ke9iyf2RmSMKchMDlkeVct0wrlaIsPLIvyOPhTRNXWLSyuSDQioFjLB6dnuC0gv+HlcGuYuPGvKIFfDqI7T58cC8Q0/1FrG8PdM6vO6vHQjYxHqTnGoeG3zR1LsNjOKFrlknY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733991; c=relaxed/simple;
	bh=o6rZLVkG1sq/4BZGymOihUcF9tHkCw2+D/PK2hEwG9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBAMui8cJk75+VU+GF8d0wkE1opBXdU2ap2CuFovwUATJQt+zvVJGPq9K0ONI/BPhhJBiFxKNOedoPXdwJyW6Pe3WbfnpPYPxrHpACHvDvo81TLThyjsnG62Wj5AcsBALFE7rf82K2kb0eAQK/tJy0cS5VEkfLBFwgj754ZIZ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jueRmeAk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jueRmeAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094651F000E9;
	Mon, 29 Jun 2026 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782733990;
	bh=o6rZLVkG1sq/4BZGymOihUcF9tHkCw2+D/PK2hEwG9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jueRmeAk+vbC5qNPeX7tO6jKvFV/8324+x1OLpRIWY5VzmyzuM8/i//ek8l97AVqo
	 sZbnaels3qxfAhXkWu/pJ2KzTSYYwaqU3C+KEhugzxx689ISrGPOjOQewMTFf3R0LF
	 Usz3lYMji97dSUZmXQIa7Lznx9pENW56MXhhg9H6oPuxkgvfMO707xAcSfDt6FY+ye
	 RQ+LtyuWQkSvCP6NjEcNsFlKUTo7X/D1Q4UXm5DGQdQ9v0yeFHQfJy0mGuu+ynwBU3
	 SBeo3z3iRLCkF/K3QESRbVtaDKyEoBRLbAnMnBS3nALw3jCIM6UGlk0LsF5F/I3m36
	 MrMDYquGQvcJw==
Message-ID: <a9f1b6a5-ccf5-4bb1-96a8-54a3ed8f3f81@kernel.org>
Date: Mon, 29 Jun 2026 13:53:04 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: nova-core: falcon: store bar and dev in falcon
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Tim Kovalenko <tim.kovalenko@proton.me>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
References: <20260625-drm-bar-refactor-v2-1-9db6b890d92e@proton.me>
 <DJLIEZJL9ZS6.J2642U4G4CT4@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DJLIEZJL9ZS6.J2642U4G4CT4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/26 1:51 PM, Alexandre Courbot wrote:
> Danilo, any objection?

Please do,

Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks!
