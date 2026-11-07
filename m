Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794056736;
	b=bBDW3/xlaUHDMyd3Y+Kj8781dMMYfqXbhsDdep9P9mJ1rljpjeRUoP6h4aWBgduxB5MO
	 8PRp4iuFzq2SKLI8oR+V9c+pCCJ0koc/SkPjlnqlShkaQS9Mtp7jhJiHkzlwupWMcM1c4
	 jB+aWk/QfBT7EXzvOyfC9xY4SnHF+5KXgSkJi8goYbUhPoTABlwffgq4cPk7iSa+OJXPE
	 zQdLudYxMeTcvm39z+BL3bTqShyJyJ80oGR11Okn5pdAonrZ4XIlephvqMcdMTuZZ5K0H
	 77FsJGgX25pX51QeQwhMMvqzVmbCMt7x5m71P8vMWfrJxOjlFiCoHyWjE87oehDwgTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794056736;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=rYqeNBed//aUso9h3NDMo/epkX/7HrNV/QjT/z9k1Ss=;
	b=X7ZJReb8B8WdXERZFNItO4t1bvoFSlQ5m2gZwzzPJBtZFlm37fblvta3p25lOogPSFrv
	 YdwF+M1ocau/mvsLN709jutfCHOmrAOgNy6hexmfIoLVw5aNve2nq1hS/iSnbfSr+WRFl
	 C0u7KciqtS/45cfqnnM2UUZDz9w43lo+jAWKUeBUyEtzMfWhbT3TO3j9gnbNRPMXpv8el
	 iPL3nokQML0A7PZDISVMczAG4N2Wo6uEo3NvqpQV6dmmraqGEejLpuBC9JEzkxfnRIrQt
	 v7I2pBlhgB6/rPk3qjvB4GmhQKXpigu7cQwrAVADtXp7A2QXqCsbOyAI5icjNtLv7Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0r9MZRe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F99C606A32C;
	Sat,  7 Nov 2026 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0r9MZRe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590FA1F008A4;
	Sat,  7 Nov 2026 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794056736;
	bh=rYqeNBed//aUso9h3NDMo/epkX/7HrNV/QjT/z9k1Ss=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=A0r9MZRetEvVa+dMthvCVtFMvOuaaemVTDV8WVlfmyS1qyaA12o8pEKgN7au/jvNG
	 orLAQ45eruZbQYwsin0gOwd6HbWhYoiUW1bcVWa6M0OMFKzXNC9yaPBu3w/f7WFik3
	 ttlIcZmRfuXXImfpncKXFwccRZ+MpgjUsDympNa+hWye0I6jLEhDe/BpGMgulY9vmh
	 TI+vwg6X1Yl50+8YMxAEFX6KnvkDVfIewoEyQW4bSjDvMlN+FaFIAjR8iSo8PD3UzB
	 nePVNAL4Cz+ImI3FZe1Vee4hZzNxdGs/Z8tKQcPT/iGEI6qpBRlXyinWVCm52lgPpH
	 mBZaTP4/rWqbg==
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
Date: Sat, 07 Nov 2026 14:05:31 +0100
Message-Id: <DMP018P7T755.1IJWOWDYOLB2B@kernel.org>
Subject: Re: [PATCH v2 06/12] rust: io: register: implement Copy and Clone
 for RegisterArrayLoc
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>

On Sat Nov 7, 2026 at 10:48 AM CET, Alexandre Courbot wrote:
> Register array locations are small values that are cheap to copy, but
> obtaining one can fail. Making them implement `Copy` lets the same
> location be checked once and used for several accesses.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
