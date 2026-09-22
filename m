Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7A3A2E3F
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087461; cv=pass; b=d5FOJTIOETu1R/Df7do4vy5cjqoX+NIpjGzstpwoatxWB3vvFN0t3GbepVvk3Qx2PGXmCWXhITQRaf80re6zjnnxUqhEvQYxcIlGA25aFNAupnzz8NySJQ6vTdO8REO7iXfV5rbUJsMNjHHPBnB3t5JRgQxM8DqEWvUB9yutKoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087461; c=relaxed/simple;
	bh=Qhmg0costCnWVv2CupfAZqG162jlSCbCHCOd5p6+oMk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=C3ZCTkULcFFIAxlD38bpqKN02V3jsFSLifzwbuOiF4+nitWRBJ6bQgf88mag6O/dbifvopTjQNtJXlr41iCiO9FAx6oSEAIR/0VxZtJp9XZMwNdcNCHst0R/l9vwf4AwxEPen7cMcg/kUl9vJcUIkmrx4XucQtTPC3cEhgcBm74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyNMSVXF; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyNMSVXF"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so3517097a91.0
        for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 07:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087460; cv=none;
        d=google.com; s=arc-20260327;
        b=YdEkxACrf+3/3p6H7o2UdfmFDCcpLFlk41JcAKFb87icpYqbAarEiMtrSuiiMcBs+y
         QeFKGcKZkRsFaV5MNcH59yIoV51bOZpjrSLQ0ju0w2iEx+WIYojNeaynNaFOvyrv8KEH
         zxeeyo91OIboEgjE+oOefUdu6B+h/s4WmYByVCwohTDJZTei/KVytK1RJqZnxsp8n4Gh
         JT5f7nZ/grOrjkzaQ+Qp8zwB6BRmdUQNNeePIV3O5+6GKZGFQx71awIf38XsoG4A1Kkb
         E6QeKJ+e+mvqGFutwPIOu0KNA2xwUPCUZ1AXaIFfbyzH788D/ob4KDzsbuov4UU0dPxK
         rlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Qhmg0costCnWVv2CupfAZqG162jlSCbCHCOd5p6+oMk=;
        fh=XfYYKbSvJ/qa7BpzhKs15BMx9ORNVTmgW6BiICcLNTo=;
        b=HNVg422kkpeIyIkylo2ubtMDyXCTk+Kd9/dpvbjHoONEACnP2Z5x7BuiAYyzjXLEm6
         /O5/0dHFsl35B0/v6gV0S8od9JofjYmTYNIAt9eViebVAbiCNoe8Bp9/JRcO5DZkBVtB
         W3kTP/Klp6pt+573wKAbi+b9tgpkWK71l6JLVgH0mCke/n/od6Vpv61BKDMEkusaLMS2
         sa6l0bsktSTR0S/uwOi/3Fo//vLL/w5pEIFDcYBKTm0RtBDU4Lqa/3ezUE4NlJpOFm1g
         dopAeDoujJNXuUzkFi4wy4dQlPxOdlf8NShvcFyYd5mEKGzUd9BN69KjA8+mgwOs9Mpp
         rEWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087460; x=1790692260; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qhmg0costCnWVv2CupfAZqG162jlSCbCHCOd5p6+oMk=;
        b=XyNMSVXFn8b94zpJOc5SJ5BizxpTwPKBZtPgsEV7UURRWV6KupmuCFsuPSUy7MxkAX
         sNOmSKRrYsGCcDhyPOR/Wt/szDjp4OsyPbzVu8y5Nl7K/DAjy+cQBoHKKlffUbttNwDB
         1w7yRyNifbbzBFob8iA1IPwg6UAL+9hIekB9UgcYCxw0t3x69xNoWoHM4QwzEuTM1ET2
         hds3q/lCcRJawRkQv9wrp+41ti8EvXpFyNQT1y1/2KfdHCY6qI+hJjlHGqMTMpxBFZJ6
         VS2FQAJKj1txojZzbiTJGRRDE7eMDh8O/pe/jSCycxPXHCheamzJLRsnVHEQNLGQwm2a
         2dOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087460; x=1790692260;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qhmg0costCnWVv2CupfAZqG162jlSCbCHCOd5p6+oMk=;
        b=qM/ffT7ev2qKTzJuozrz9+uDbeIvYca90doSuYLgZ/pJi7WGm5acV+hwjBzWvtdzTc
         iuXNFAJtO7JDjszmekmJi3jbtdxIplo1dg9WorLDIioQnTag4ThgyKFeHUuYYOyA61mG
         RQKodJrOenlVhcqKCNDZ5nu5FUDtwnYmxKt50YV5J/ospFExLWvgrrWo1iKSc+R7DBN2
         kLZ4XaPl25vVoD5xxTsAJZl2Yiwj6qU3dX1a6Opbrpu0NVzb46ZwZae3hUAqhTD//gzj
         OaYE2lbTz2242VBJg9iRTEOTOqzQJoP1Qz3owLjWNqgkJWZFSn6OXjtAW+BIdYDSTjkA
         72tg==
X-Gm-Message-State: AFuF++m5lyvsqRA4zwAYMaXC06+mwjLCy2thBUGIwCiafmvEMha7SFVi
	U9LvXs5dDBPjJ+HjIuyAqFvYjKm7GBemb7sawvd6Gmvs4ijEnX8cashBESOrAIFeErkjuxW2AIq
	LHJATQjIUP88gnguLchF3YpIFoIdAWusWUwd+
X-Gm-Gg: AYBFou2acakseHeSnvVS118fuxJdEqWZFJuif0Snf9vTGmevGpnauLa0SFCL3J5C2hr
	UXlmD9/Oe36CeHyvPQ09JgwBnbabp7gxXCE7I0tr4jdbZud4b1kmcM6Zl9gWqCVld2/m+oqTm9X
	Y89BJrW49dN0L1Og3a2XYoKuLwLiCO+5NlBRzg+PeFM+rzIr/F2Prjnl38wwQ2s+7RpAX1gytaU
	ISDhLI+iF2kuroTyatoTA4dv4Yr2v7oMDBTIS6TZznN1i/CTIJD8A9C0RjOLFjtYFlWxdr9g9qf
	xq7UbUSAu/KWINEPad7xIH8c5oj16E3hzb6ep10MYWuZrRUrSmHAQUtClVe4mhUhBzTmEHJytQ6
	SaZrt9weo7OKV3Z1umAVP
X-Received: by 2002:a17:90b:56cd:b0:3a0:4146:2954 with SMTP id
 98e67ed59e1d1-3a07321d136mr1440918a91.27.1790087459785; Tue, 22 Sep 2026
 07:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Aditya Tipre <tipreaditya@gmail.com>
Date: Tue, 22 Sep 2026 10:30:48 -0400
X-Gm-Features: AcwNN1VoQv8DgFhQI7w78do5KzsWXHoY59dmjKt8sY9FrXEaVXOoPp-ZMLxy8sU
Message-ID: <CANtwgCK0p-KrpNJTWjiPd0xZcNJ3fUxO7aVpUGyojADdK4hzCw@mail.gmail.com>
Subject: Inquires about Instance Memory / BAR2 task
To: nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I=E2=80=99m interested in working on the Instance Memory/BAR2 task listed i=
n
the Nova documentation, but I wanted to check that it=E2=80=99s still open
before getting started.

I looked through drm-rust-next and the recent r000 firmware series. It
looks like the general MM, VMM, PRAMIN, and BAR1 pieces are there but
I couldn=E2=80=99t find an actual BAR2 VMM or instance memory implementatio=
n.

Is anyone already working on this? If not, would it make sense for me
to take it on, and should I work from drm-rust-next or wait for the
r000 series?

Regards,
Aditya
