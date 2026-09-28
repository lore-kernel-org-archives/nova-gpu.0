Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C2A3DAAC8
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603770; cv=none; b=eukznWsvzowJ39By82cPeMH5lB9R/nFCvUJ8sTL4/EADPQkzy2MPGLoRZWgQFHplA1xvNdhoVeZ2WsByWkiwVSub8rS/5mA3Pv6dgLSaPIwbR8d/p1GKDwDFQ/+pmksMi5lsrcEpsT8TqqUs/cnAP048/ZYHcVbVC9yM9sMfE9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603770; c=relaxed/simple;
	bh=tSm+YTD742o0zfj6zDu82eqC0y8uINQoeZ9wBJfEDbo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=sicsIKFQyxWLiH1e/7TKrZPFxQ3xaq27iVkurwyOed0W1n7KUArwovJ38cuqk0vsqZOG5VAuUxyO0vdFSra74sdNM38IVETaYKWyX5mIS99sQh5JG4XakyLiyQ5SGBVW+9S0Jvz0V67RpL/9FSmOojhJXxPcveCEy4HhrMzBkjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHsOIZ2K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHsOIZ2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4771F000FF;
	Mon, 28 Sep 2026 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790603768;
	bh=tSm+YTD742o0zfj6zDu82eqC0y8uINQoeZ9wBJfEDbo=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=HHsOIZ2K4oD0hfXATZ4G5wrt8ugd2HYGvi2DJtAXYENvo4O5iDdfDf+Jnf19phXRf
	 2CutW1X1+t52SVnfs4pxsGwzwxzC/LBCJgvH1u5/5MwGc40SkaZyD2IVn9aVIy7FAZ
	 fdYt1RE5zzGa2z8KD+NKpcdbctd+y7iKL9G1vgsZz3AiOItv0w/txKJFFxXCKWXrWb
	 CDHFlZZJoKy79KaZSXcbJCwHRhCPWIde1fGuHq9Li9MNz+CiEAST01WwZDPHtoNzKI
	 VO4dbkCHmySG6fcViV9qd23nHfh7Tocaqx+eVub3tTpxyiR9yQXgtCDvJ3CzfhFVPI
	 NdZKGpQgg3TbA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 15:56:06 +0200
Message-Id: <DLR0263QSRRB.L2EQ3NXDYBT9@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use a single try_pin_init!() block in
 probe()
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
To: "Gary Guo" <gary@garyguo.net>
References: <20260927144417.1280385-1-dakr@kernel.org>
 <DLQX3FCYMAGD.3MS8E1JK5J7D2@garyguo.net>
 <DLQXLV1FYMQS.JBP531K4P4T8@kernel.org>
 <DLQXTBWUJWGP.WGY6G88ATQM7@garyguo.net>
 <DLQXWXRP3P1J.28SLFOJJQ2EDK@kernel.org>
 <DLR009WMVVQ5.26C5V2E6GFD40@garyguo.net>
In-Reply-To: <DLR009WMVVQ5.26C5V2E6GFD40@garyguo.net>

On Mon Sep 28, 2026 at 3:53 PM CEST, Gary Guo wrote:
> Does this fix it for you?

Yes, it does, thanks!
