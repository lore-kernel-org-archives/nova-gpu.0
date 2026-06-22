Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59013175A85;
	Mon, 22 Jun 2026 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146640; cv=none; b=nUAkJTM/MH66jxv1q9EIuROHXg6rVQgOvtRyZKducogt0m7yHBsN99St+2aCwnll4zu8NPX/WFZr3EKaz2iplSUXew53WrUXN4SMERCK0NCF60awbqIVy3lZ/ZliKFFGvUfy/MqFe/UHU9I0irLdlIsA4MOp8FiOhhdf2CGs9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146640; c=relaxed/simple;
	bh=VeRf5a1JjJThLLC8DXHxL+lf7PQW42Pqa0PPW6PYmus=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QkSCz3c09wQJMyydbWGDxKbmaGLnhpMJg/jxD9pXIna5T7zzBlyitNRGkfvOWosaALTVVK/PDbE8p9WkqN62WINr972pzlBHLM1vUknHn81ngZDYEgADqn6st14wc3iZCLAjCiH1urG+NAcAEiEZeV8hptO5lmqY4ARtpwThsKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHhIZbOG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHhIZbOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98F81F000E9;
	Mon, 22 Jun 2026 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146639;
	bh=VeRf5a1JjJThLLC8DXHxL+lf7PQW42Pqa0PPW6PYmus=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=MHhIZbOGeBK9U1PN933ovM8rwgZtCOWwm5gDSKyBc4FrO8FEKGqYq9vfaS+ppc5Ob
	 SO9uyefZxk/2nWuOBmGA42rQPU+0jRDxoR6ftbZjpwjiUkM4s7+/qxUk1qQs55jHln
	 9Sgo1Vg2/uGvDKNpFTK/s0jUzm3zzg5oom0vMucJ/gACj3fUsPYJCdm0T5jvQ5PUVK
	 HYxngmkWDW1W4iniPFpF1wlKSGb87hdoem7fwGTQ8OOHOzF+xWH+MBWNFboHHV2uyM
	 oAC700Ekuo/F+SwZDiZuj/Oq8ugE4fqnMjQUwYj/DIHoAHCk/q/XmerHQBoXPP0I12
	 cACL3I/1T+vWg==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 18:43:55 +0200
Message-Id: <DJFQ99U8SXA0.1LYOKI1A4F0NB@kernel.org>
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
 <DJDY31W202BF.4OHIYPH1MEDX@kernel.org>
 <DJF6F4194K7C.P89RQTXATU6O@nvidia.com>
In-Reply-To: <DJF6F4194K7C.P89RQTXATU6O@nvidia.com>

On Mon Jun 22, 2026 at 3:11 AM CEST, Alexandre Courbot wrote:
> I took a deeper look at OpenRM. The zero FB region error is emitted when
> mirroring the list of FB regions [1], which is a default HAL method.
> Zero-VRAM chips like Tegra replace it with an empty stub.

Thanks for checking! With the dev_info!() logs fixed,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
