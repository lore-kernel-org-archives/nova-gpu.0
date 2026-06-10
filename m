Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053E840D596
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781127975; cv=none; b=b4h3v9EVOwDdwyKkkEt4axWfYqkqzOJgjg74IK0u7XME/WMe2CfrZ55RGt66iaa8eXtP8M9JxUco0ABf9pvf8mkLvhM45dPFTFpupNgZr4o3a853hk7IEhVPDvAfXufdSSxhyb2NPf1n7gccqFt4g4V+sE0ylFgHIlfuYQqKeXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781127975; c=relaxed/simple;
	bh=xzQcKUvFtackC86l0v+2t7YuBaQrSigNs0nnEb0JXEU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=CWAJPVW6WVQeDzYcpSkLiHMulHhsbjJ/ykiEVg96YT6AfK3U2WsZlFdfowvbScFQRWTQyLbj2gpXm1I4RcsyOetK0nygL7HOziBrbAc8kLyNnUKBlXScMVlPC+RCFizYYzt2yxu+v9Gml88ArynZpP9+Hvc9xlPa2dhvMdH2ACs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdgwlAJp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdgwlAJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F141F00893;
	Wed, 10 Jun 2026 21:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781127974;
	bh=xzQcKUvFtackC86l0v+2t7YuBaQrSigNs0nnEb0JXEU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=BdgwlAJpCLx8ImSlZ6P5LuWY7zskxy6Uf4CmzH2tXgA4ZtKxz4GxU+OYpP9BhCCIe
	 Uit75tQc061/GjmudUMw7j8zT82OUdTX4ER5+9//NQEQEiD+G+UYP6ZP7PzSMLxpIf
	 C0oT3Bh2On0lb+aqnDhBx8MqzLpS78KDgk4Auo+hMfq3UqeK3HHWBM/jhxygfEv5Pi
	 uYFbCZ24cbh73sSlCDMZ3pw2jByga4AtPucNjIJd2Ln5nZcrB0790qeSJceT2nZ9cC
	 U0LiEdXBrevSsSSCRfPokyaaB/3RCPRp0khEkLdG3rjca6BJw179O0bVrUzbx215Aw
	 g3V6/Grz4pqFw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 23:46:11 +0200
Message-Id: <DJ5P666MGTT7.1RCXIAZ8KED3W@kernel.org>
Subject: Re: [PATCH 1/8] rust: firmware: add request_into_buf()
Cc: "Timur Tabi" <ttabi@nvidia.com>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-2-ttabi@nvidia.com>
 <DJ5KFI6X3U8A.1TFKQTCR63RPI@garyguo.net>
 <68142d2b64917b18257d092ec0e8bb0ade3bf4e9.camel@nvidia.com>
 <DJ5NHI02AF3B.WOW85000DWA6@garyguo.net>
In-Reply-To: <DJ5NHI02AF3B.WOW85000DWA6@garyguo.net>

On Wed Jun 10, 2026 at 10:26 PM CEST, Gary Guo wrote:
> BTW, this thread should have been cc'ed to the RfL list, as the abstracti=
on is
> changed.

FIRMWARE LOADER uses the driver-core list, so please Cc:
driver-core@lists.linux.dev and the other FW loader maintainers.
