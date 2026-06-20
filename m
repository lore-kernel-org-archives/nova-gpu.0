Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54B13537F5;
	Sat, 20 Jun 2026 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781965601; cv=none; b=tbXcDJf0Da1oEcbX9jFOc3Z17Tm4dopIpNWJXlHy+l3tzWBkzb+0Ew1QvXIOJrGpxh7IoCRnzPCpmuVNeSpUdguKV+ywuH4KiyDr+i4fcgrCmfXdd5lLSJkvVsjtXM9r2hy8IrIKDLfP8bSJTZHgZKYnMPASGqkBGQ2H3Ndv0s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781965601; c=relaxed/simple;
	bh=uKoP3mE/mbENnzJpcGwFTZXlmjtVUFD2Jrk0YPULJDQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MDjHfzLaZ+9KEWETdIqz5AZNq9HI2IxX9oU8IO78peosjOkrOWpEbTul/4QrGyCARkq14WlEZMcNcXVGyBBbyYhYg++dn9QP1tPirHIRHrnIutJdfIc/eyx3bPVtp8QyxMJPw7QKCE0ikePCwOauJVvTOAC/QPQLpVU0F3SCYJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVJvgP/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVJvgP/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474301F000E9;
	Sat, 20 Jun 2026 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781965600;
	bh=uKoP3mE/mbENnzJpcGwFTZXlmjtVUFD2Jrk0YPULJDQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=KVJvgP/VzEKlJFxCT9S9o3ZDNmjjEdv+E+Q7aPDVtK3zeMMf2lTO8U+mcrlFYLDWg
	 sWYW2x7RROMhixSb6BcriF+ZnBp+q2dh/YVd4NpYBDJvUs/zI/uWS4bqGMI7+qvkrp
	 kJWYumWN1CPjAMwo78tLmbDZUUW783CKgcjcb+BPyBF4FVqkRFR2IzGLtU9MjnfShY
	 fei1aJn81F/suSVhsNsR+7ETBget4GtvipcrxwTak5Rv2ilTA83eAg1mGLbHYwJ6BT
	 nY13/64k6Zkf08mceIjyqo3/I4TGAcih724IjYc8Ih+l06JJFSPdAB7M0f6pIZPVm8
	 +sPTxdsQoXRAQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Jun 2026 16:26:36 +0200
Message-Id: <DJDY31W202BF.4OHIYPH1MEDX@kernel.org>
Subject: Re: [PATCH v3 3/3] gpu: nova-core: gsp: Extract and display usable
 FB regions from GSP
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260617-boot-vram-v3-0-20b9ec5fe9f2@nvidia.com>
 <20260617-boot-vram-v3-3-20b9ec5fe9f2@nvidia.com>
 <DJDUCF0FN8M3.OKSUDWCKJ4PR@kernel.org>
 <DJDXNDGXLZZY.8IEHLBTRKCQO@nvidia.com>
In-Reply-To: <DJDXNDGXLZZY.8IEHLBTRKCQO@nvidia.com>

On Sat Jun 20, 2026 at 4:06 PM CEST, Alexandre Courbot wrote:
> I expect that the users of the VRAM regions (i.e. the MM subsystem) will
> not be able to contruct properly if no region is detected, and that sound=
s
> like the right place to raise an error rather than making an assumption
> here that no VRAM region is an error. For instance, I am not sure what
> the regions layout will be on Tegra systems, although your comment about
> OpenRM seems to hint that there are regions defined for them as well.

Well, the question is whether it would just be an assumption that no VRAM r=
egion
is an error. I'm not entirely sure, but I think it generally is an error. I=
f
that's confirmed I'd rather fail early and with a clear message, and not ca=
rry
on with something we already know won't work out.
