Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA83CFF72;
	Fri, 29 May 2026 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053349; cv=none; b=P/w/0FxZKcEHlYnNhfFPAvUQBfwKnLPvyywftb5C14q+4OXNVzJG06crYKgU86xMcrmITQAeunQXoOI9tDZUFr7JV7dRr29hjL8vZx1WMIM3I16IFUzI0YWBE1KxwxxRlU0weYQ4c9sBN0lCrhwxjs/lqa7DuebzScdh77g9qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053349; c=relaxed/simple;
	bh=RKerTwBPlEkp1AoKfHTIHH2M4SsnZfTHsiA96JlVWAQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hadUNt68jIBp8kuqofCYImM/et5YHrPZuHPllq+Aze0O7IdenaBt0VSnfkf2SfFImyAZIP98RdJ82a0XHldr2GnRZR2Lq1maXrgR0N0DaBRrmxzkbh6a9IXrzTPY7IF1Md7OrRQi6DOE16uuct8bxkyETaY9N8xHrY/KBbYjV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEkG/OZh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEkG/OZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633071F00893;
	Fri, 29 May 2026 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780053348;
	bh=N5Mhwu56fACKBFI/ybtg1k7sKqLtp73anF5nOE+olEY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=JEkG/OZhSeqgRe7b/76jf0sGMfVWPrdypx401L12VmmA+ERwDx/OPQaUmIpu3dFuJ
	 G0c1jqbzyw2TY/ywjTmlx6VcJVhqsyfsrHq0bjrsXWnClEspF3c90gEJyrlFeqNAGW
	 z2cqWUoWZNNIG27zMnG61wZIWtmzJyTOKcoAvUVhx2ngwD8q/se1Elkz3dGQK+Yk9U
	 J9pfG2dh01eklOrMfzIyNaFqVB95I0DfHR2AiAPq/eniBDfC6rN68+0/fKr6ikT3PW
	 5cHn3y0BeaK1DAWCECTMZf2J0ELbalCxdMD7o+YKWn4t0301qHkLGAdslFyzd/v+U6
	 E9na2k+KED1uA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 13:15:44 +0200
Message-Id: <DIV48XH2KKI4.1AI7LJQBHVGM3@kernel.org>
Subject: Re: [PATCH v7 0/4] gpu: nova-core: run unload sequence upon
 unbinding
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260529-nova-unload-v7-0-678f39209e00@nvidia.com>
In-Reply-To: <20260529-nova-unload-v7-0-678f39209e00@nvidia.com>

On Fri May 29, 2026 at 9:33 AM CEST, Alexandre Courbot wrote:
> Alexandre Courbot (4):
>       gpu: nova-core: gsp: move chipset-specific parts of the boot proces=
s into a HAL
>       gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP command upon unload=
ing
>       gpu: nova-core: run Booter Unloader and FWSEC-SB upon unbinding
>       gpu: nova-core: gsp: run the unload bundle if Gsp::boot() fails

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

NIT: There's a few places with Result<()> instead of just Result that could=
 be
cleaned up (including the moved code).
