Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DE8403AE4
	for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737022; cv=none; b=ZLpjCag/6C9jXcnwVFjdlVienAoGQuoOPdzNDqnJfXA0e1bSWmnkjM76zfHn3IHiztTL5vtEnZdtrlXWSmoCjk+Oq4QqMmgq/OsvkIrq4nu/xRAt7qq4exyUSjRG0BUhpF3yOgoc3NbldrCfHrtDZwtl8AMa9Rc/zrpGplHLMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737022; c=relaxed/simple;
	bh=iL8eQCnQSbG2ojygIK5P3cXtGszj1MWC/yVH3lFhswM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ue+xPKFxcEgsUmpydJbPlPv5XRpYcen8f87xvJ9BZKXdWncEKk1oUTsqGU5Z84RPBdulr9zfnWKRSG5kaTuWSydDiQY9cAR6mXgRkyo/orW618Rq5tq2pqvXzNTTzNR1pg7BBcSCWTN+q/YICRfbmOzCs6irUI/3dU68GqNddWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMdpH6YD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XldQkOET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMdpH6YD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XldQkOET"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATZ062592988
	for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 12:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=; b=NMdpH6YDeqCM6Ng2
	6l+u1JT4xPqzvjoTIliP40I8uS1vyj+L87A0s/qye2JFugwtFubIXUyRV7TGDunu
	R6AT7ytIJgsoT9qLUDl4wVFliJkW4IuqsH8CbCK3KeaS2RCkVYPYUJb3E2XmVf/n
	n3hDCcBxNJlzKeVUAMJaWhtjvocMm4xmBllzsNmFZBHpLfh9MoNKpAQANg8pAcNm
	TXF0zOy0GX+9LwYTaSDruBciQSlEcjcnL39ePRYOwyzIFsHATrj9EfyXaS+7TQfj
	LXtLZZhSE0HawuL0/q6HT7LO9lTXKMaK7kYXAJnJbjWc2xRjybwKZ0RF9NkF8Rk6
	8fCEwA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhnyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 12:43:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e4045395cso3804916a91.1
        for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782737019; x=1783341819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=;
        b=XldQkOETfZlr4LLQ1JwC99q7VfA8GywAlZRXQ4wKsbvDOpi+TgYNfRuiKi3YM6PQl5
         011NF2yckC70goz+ir0DkU+MhDR+ktFrSOfP1vni+CyFTbSAroRllxdEilK9WRpujXUj
         Vcmf5zn7AcXbscnJVBUk1H0qXKyoEUDna+ZvxrbXhOOsY+E8D/rdVMdADyFSZvCoua0H
         rk3ad5Xlz8shv+Tx6tPStLFAP7mLqhfoL3A/cSZjZaVHV3y/fK1SPkfi7m+kXFMPRPuK
         kB9X1SfNXrVsa9LOgTJ2CXNUtW4EiiX7s6QEjMOr7H7ltchKmhFjEXgFt/m+Fmg3o1Pv
         Pg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737019; x=1783341819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=;
        b=sTnXFb8tf0sVwdmavU2Lpv4d09n9hgiWKRr3EcNk4IIVAMnMPW3pJUFvUVgUuO7Xd1
         Wneb57Nx6pP1rJMCVxBUptYGgn9bOBmowxObx7mRd0rSnNu2cNvGRoI3DUM8Pe6bCgOw
         aeZu7st/taUFaJPGLxUKpoOUbTAvatuZilq9Suna5RkiyQ5W98MnQ18vSYwuQCWC9Qdo
         3h+U0y7WR76XCKOYANyHfjOgQRNW6y2TBSijw4n3PsGJI3vbtCD6pKju0h4n+qhQG1G3
         8S/kltThyylby4hhHQw3OFiFA4dAHEXD6jREKw+tJPRAZZBj/OztuaewmlKMQgz4Jw6j
         eNWw==
X-Forwarded-Encrypted: i=1; AHgh+RrprZyTD7BROvXFwsHmlEHVf5z5YwWivGhE456pszyRwiULWzL9eIYl4vyNuwnVX5ntnrW/jlcskA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMPhxtZLPV3i0gtipjpf9FnYcTP7zd8io9kaTY8rY2XFm+2jF5
	RVVgh4FSO2d8hV7cimXSGSbsP6XpGNVRahrh8j9pTJgBTcuxZ690lpQ6ctUkP37MoAh4CZtcTiw
	Q814+11eBLakitaFHF5V5zkpM8RMNTiB2oCXer/knUoesJQVV4k1ahkWogvk36g==
X-Gm-Gg: AfdE7cn6tPU6uKXgtWQCLteXr7qPg6tmSXTJ2Nhcdf66IepgicRLXmpia0s73S5JNR3
	snIuyZHxWd/HDtyESHjl5f/997I56hgrpK+f6ND8yvSMeGsI4Caya9Z2sSQCOHykZZ4hxZJKdmm
	tgHhaGh/OK8+abJsP7wqf2ol1skED3MAFM43N+k3OysWuBFtICUvgtBFLR7jjcJkZuiVYlpZ2Z3
	4IYY58dMj1bhvubQzvH/TpjZIBUboQN/562yuIfiHx3HVt7NPOapWC+4Oh5QM9QeOgy/XP0t6eP
	iBjjKg4ghO79PPtiP1hpsLPeDNApnMYTJnVBw+w+C25yMIvUa1FuKcI2h/7LvQ75T0iXqzktgnF
	FwDMQjR+Q8r7sG+r16XjEWSJhdIKcKn75s3RGU3yNiO6S1yFS9IQPZUShIS4yyrKaah2p6O5IJz
	4AnA1CRQ==
X-Received: by 2002:a17:90b:4ecd:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-37f9ce2229dmr7491061a91.30.1782737019094;
        Mon, 29 Jun 2026 05:43:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4ecd:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-37f9ce2229dmr7491002a91.30.1782737018606;
        Mon, 29 Jun 2026 05:43:38 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37eaff87f61sm5602580a91.17.2026.06.29.05.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:43:38 -0700 (PDT)
Message-ID: <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 20:43:25 +0800
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Guru Das Srinagesh <linux@gurudas.dev>, Miguel Ojeda <ojeda@kernel.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
        Abdiel Janulgue <abdiel.janulgue@gmail.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Andreas Hindborg
 <a.hindborg@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
        Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Jens Axboe <axboe@kernel.dk>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-block@vger.kernel.org,
        netdev@vger.kernel.org, nova-gpu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, zhongqiu.han@oss.qualcomm.com
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pJ32MrXSDlvzB1ahP81pffD-VYz_6mor
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a42687c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=ecjbvcZnrCEMvoAzKiMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfX9ellDiHn+uUe
 pQyc6fDkcyePbenCueMXKv0Rkok80xistQCy3i8hQ1DqQQUBEjRjxI4Qufj1lvMsnwBkrQropO+
 A/wydcbkvxh3sUUyR6favIS/J91MRgc=
X-Proofpoint-ORIG-GUID: pJ32MrXSDlvzB1ahP81pffD-VYz_6mor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfX/87azx1eEiYe
 SmeyywJsH7mo531txUrp3MQCI9h7cRSB0JgpYhjaLPwauNcGfx3AexXAZH3lC2ap9GWtezFzeHD
 pC6CjVVeXbJa1732JgZBSDF0+3JKAYxewsEtVZBYQ9LZoNcv9787f44tAI1rjlSBN6aIhHvleXU
 mQWPQFaKDQdZ7Vm7791gxVCj/Lb/TySxRMUxROB4OxM5OFbKsfgUMgFbXI98pRh4SC7kDoiu6OO
 +ytscAltweZzh8gUY+op8RnyXuhy+rR6OQGTtAg+1d0W3rp7OCe8L6Vx2ZlYtNdHM558VoMI5Bc
 Z9XJTbKNs+uiW6DE1zu/gMp847GFGFScoAO1JEO/f+D0toay/6J3LmOT5FWfOqo7q00lZTo2ZBA
 ARf1LqDYfQkZKbNpFVqN4a135UzXUH/8CS94kKEBrxRL4EobKN3RB3PHBtpl2xZ3OPTSU6WP0Pm
 KWzlyfnL3CaNPJm5njw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290105

On 6/29/2026 11:38 AM, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
>   drivers/cpufreq/rcpufreq_dt.rs | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

Hi Guru Das,

> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 10106fa13095..6f83cf8955a6 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -6,7 +6,10 @@
>       clk::Clk,
>       cpu, cpufreq,

The change seems reasonable according to the Rust coding guidelines:

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/tree/Documentation/rust/coding-guidelines.rst#n44

     "each item goes into its own line, and braces are used as soon as
      there is more than one item in a list."

If the preferred style is to place each imported item on its own line,
shouldn't imports such as

     cpu, cpufreq,

be formatted similarly as well? Have you run: "make LLVM=1 rustfmtcheck" 
on this change?

>       cpumask::CpumaskVar,
> -    device::{Core, Device},
> +    device::{
> +        Core,
> +        Device, //
> +    },
>       error::code::*,
>       macros::vtable,
>       module_platform_driver, of, opp, platform,

Likewise?

> 


-- 
Thx and BRs,
Zhongqiu Han
