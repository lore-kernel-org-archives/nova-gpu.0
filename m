Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623BE34575A;
	Mon,  8 Jun 2026 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780940203; cv=none; b=FbTCZXFaXKHB1DDd1iu59RXb2NgAgAxWDHZwY9/FQ55M8GRerNiKivvipLjiMjOkWfQesdmI9pwzCfCPL0Se0JUfUnj8af6cFU4pHAUg6B4eD5SucCBNv52NHsjPNgVjGYodGw2hVNpbRxL9+qgUEmWnfCs1T7Qn2wCyAHQyUSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780940203; c=relaxed/simple;
	bh=5lfr28QiDGhTqyG9eIeYlwhwDp5Q8cRi03fbHAnOibE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lkBJHcYCtH3Dx+82PontWyZb98rx9zfQ5Vw9VKamDuhy0a29ThtA9cO8s4RZwvOt0wTd39/q+tdEfstSXEfW10gywng21BdwevIOxJud1JMdoG0EGkZnjDhuWmr59kRBgldivWyXmvosK1dpUk+v6XDyqL3KogiI/mhKFfDd+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQNG40QC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQNG40QC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF801F00893;
	Mon,  8 Jun 2026 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780940202;
	bh=5lfr28QiDGhTqyG9eIeYlwhwDp5Q8cRi03fbHAnOibE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=XQNG40QCArX1FXi2xgauKq9GSLDcU2yMFO3MazgovE0r5tEQxn4ukqt/FT1HXM+iS
	 gyp8soKq2cLyksg1xBxJEp93ZWCZxT5EmVQQtIeuRNUL4s/iHtN2dqLuP+Uonbd7Zs
	 FQ9Fxw7EJ58r3aNzngaOXO4mqQuJ2MHhEZcaely7sPPG+1Wq0jFg29oOTGXpZGShRH
	 IQcz1QVEta2kmjo1/giIZdTAwa4l94G9d6/qRqpURkypEhFsBgHTEZvTiI1FMLMoRq
	 XtAVh3lqDhUNjMLwbZ3PeASpC9ORAHaNozaFFgGeS5fgQQS843cdzyycyP88Av/guO
	 0lsvqkbFaJGNw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 19:36:38 +0200
Message-Id: <DJ3UM0KW4AUJ.1K14QS8R7LXJV@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: Move gsp register definition
 into gsp module
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>
To: "Antonin Malzieu Ridolfi" <dev@nanonej.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260607140949.152575-1-dev@nanonej.com>
In-Reply-To: <20260607140949.152575-1-dev@nanonej.com>

On Sun Jun 7, 2026 at 4:10 PM CEST, Antonin Malzieu Ridolfi wrote:
> Split the gsp register definitions grouped in nova root
> register file to the gsp module which actually use them.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>

Thanks for the patch, the contents are fine.

However, the patch is mangled after fetching it with b4 (probably caused by
multipart/signed with nested multipart/mixed); please prefer plain text (se=
e
also [1]).

No need to resend AFAIC; I can also fix it up on my end for this one.

Thanks,
Danilo

[1] https://docs.kernel.org/process/email-clients.html#general-preferences
