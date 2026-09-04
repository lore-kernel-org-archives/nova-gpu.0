Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021120.outbound.protection.outlook.com [52.101.95.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193033B2D1D
	for <nova-gpu@lists.linux.dev>; Fri,  4 Sep 2026 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520650; cv=fail; b=iAw4xFW9yIzN0tWjIbr/1UIWxJnV1e2BYnfCAFe1tOntvMMVMT0Hs+thc9uMODmOIPxrBABjDfR83C0SFGGlov9X0HktdkzjsGIWJIzLnWDyXNrA+mFAWU3YmkUJ2+HLi4pK6BRo6fLauZFazIa0g5j4RnlExWjs7C8JtgxfGlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520650; c=relaxed/simple;
	bh=sgIclST75VQ7j3ON0ZhLuFP6dRDGJk7NiyO9lzNBWY8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=heGbfqEK1EKKlj2zu1x1cVHX3/7GL0Rp51ib6N0cKf4gqjr2GPIi/wEDGchUK5tVSXiTAWQjywz+rAIWC1PMeorJrgiqlJkidqX38XXQuU4dd7vfek6tkJ7DQc39TtSgpUPstjZNaGi8MDJBCf2RS907Eu76pAlTqPIGi0a3I6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zb2sujqr; arc=fail smtp.client-ip=52.101.95.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zb2sujqr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIb6A1dJarirLuGDQgUHvONe1wtEWUu4xOkPrkZVymRWG27f8Yl2EJWRYHlYh1SRuCPXVjSH5M6la/TNc1BI8LC9Vp3woJ7rKaokC/GiklWIgvbLh9iwAxk8nX23cpN8ljpngSaEc8TUgZ18rvOWDU7TXJYaU3pzUNwJAqvNtk88gwWcLY14UsLS7j83V9VstC5grEfd0eqTUesQHl5EMQ9j2Qg0Zju1VtM6/MywLxBmuHYDSydTcD98Xe+9qt0LirC8rKhYwFDjT4uTqj9WPhWIZrRUP9eDOwM0OmIkac4PG4Ay8SCf5Yqw27yHO5ZegLjRfJtVFxo6QaArTt6YGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJ4q/Qx+U41fcqa0NWQRZoohfoYh6mAPzhrDO45LaPY=;
 b=WP01ebi66jEnF5X2etsnlDkz8WEe5d5a1ITSc2iPbA/oIDy+wUQPQZsZFLlpi5QCqEGEc7lKmeaVC3If0sIPrpZa2J4xZ6vknPOW4961uk3uFF/hsDxOAqfYC5PFBr6CUIvN/cO0tjgzlMZ9u8ebiRBW6gHe471WFRlKuJHmsTB1vMV006XZov+JKUCa/J9hwHPk5cI4DPNULScxw+bKAA3X6lnW5g9cbEKj4sMwUbDfyfTLkQsGEZoJRmO5w6+Dqbnzqxsn/DNJbiTOJNGKLJF4NvD7CHYkjty2tJLLV88kxXuNpzZaYkXhhInfZuvOvZ2bVSZCrLWhmgFJ2Rjljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJ4q/Qx+U41fcqa0NWQRZoohfoYh6mAPzhrDO45LaPY=;
 b=zb2sujqr3zP6XzLWTnNQnZYNQU5JVJ+Ys3yEe7BeqBiJKdJlrb4fD/cDdvoUQuKCUrmbtdUVXiZOSOokHrRo0y+ocBEcRtxvj1AevKLtrZz9h3FfD8l91/lWri/hfj5q6MWvYCT2pb2aHa0P0CIDvRLWqsGccv4m+nhbaFinM34=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB2542.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 11:17:22 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:17:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 12:17:19 +0100
Message-Id: <DL6HNIUL8F4C.2BK4H023OWBVK@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/14] gpu: nova-core: recover the GSP receive path
 from corrupt framing
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-10-jhubbard@nvidia.com>
 <DL6H5DZZH2LO.2G3VISAA35F0T@nvidia.com>
In-Reply-To: <DL6H5DZZH2LO.2G3VISAA35F0T@nvidia.com>
X-ClientProxiedBy: LO4P123CA0179.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::22) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB2542:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd4e1cd-5d3d-45c5-a9b9-08df0a7615d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|10070799003|366016|376014|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IjNTvkuXjRW7VS5IWk4wjpmkoLklDfO87zWJ7tJdR+h/jbyu+FHu1DAxghKOORRJUtRyCL0cyj59A0Z63JrF1SJivrp0+TEptIPaW5f3Xf6QMg++XcPzhHC0DamhHDloWxK6dgs7o+GnoFvakDNlw4jE3AoMa1WfyH4wKRHYfhrV/HcaQ7E2NRxp9Gt2bWU1biOzn6itFHtRC1vmATDIafsCkRajxRCQrlJPWDbpBbyHV1idEM4gXvHmO57edFiePet1KtSLkPd4Ek/DKyZvlhYbVdL6fXWvnLtkv9wwM5RtxrLePnfRYGJRlNVz+sVEiuvYYIbczNVzCLGUAA1+Z0lvXuCWclYXp+q97glJYwMdMMuPQqV3wDIqcrHQQRzxsu7BQnrnGJYupGNbuiJPwRyzA0xxJthzMpQs/rAoeDFdGtPgfkh75hsHKU8FEGHe7AyIAM/Ua7TJSGAtOq7IBLRHTY12IM7029fnVKyi0zAn68/sgLiN/6qmRKmdQU/ro+DJ89WqN8wI9lWK844GnT7jJnakrEvCDd1+eki7ZQpQ/nLmHMKsfpTwahR2FQMVnJDluotAx2ojQxKiXIlfvYzo1wV+s590J0lacx/TTK04nysfFsPwQivEW2Q/wZZXkrXySE3ukXuO6MZWGNQYA/KBSMM4pFXKE++rctztdBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(10070799003)(366016)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW5EV21TM0V0dmRoSDBSc3FxenYyVnRxZlc3YUExSFgwTm5HNm1PeGRUak5U?=
 =?utf-8?B?aEovVkx6eGlHUzdQVDBpNmRuRUU3YmhDUSs5QXZvMDN2NHpFbVhqcisvRXhh?=
 =?utf-8?B?Z3ozOFlVdmM3NmVqQ3BYUnZQcW1ETnk4aEFsRVlXWUZ0RWIrVGl6ZjFVQ1NQ?=
 =?utf-8?B?K3VVWW1FZUcycFJXUXg1N2Z5NEZhQXBpcFA1K0RpajZKTTBpbStnMk5lb3g4?=
 =?utf-8?B?bk8rSHpSOFZEbURRMkh3anEzTG4yVnV0UElqQTlnNnZQdjJCQ09MbFVQeWZH?=
 =?utf-8?B?REplYThGN0RLQU9jU285aU8wYWFlb1ZvRUpobzJic09CUjdTVlI2eU1zYWF4?=
 =?utf-8?B?eGlmWVBLQWR2NWZ0eTJxQ1UyUkpmenFTTXBIZDFaRytqbU5iZXVXaDIzZjM1?=
 =?utf-8?B?TG84R09QdTR6d0JieTJjTnNVckxVZE9QL0VGL3NpUXJudll4WURDSnVHL1cx?=
 =?utf-8?B?a1BOMlZOYXg0RXVNRmpHekFnYW55RnlPSmdsSGR0V2E3ckx5cEJrdjQ0ZlM4?=
 =?utf-8?B?V2VaeGIxM0gwNGY4TGc1VERicHNqRklXS3JSWTlTTTlINEpQbHY2b3RUYXB6?=
 =?utf-8?B?MXVPREpkME1xYWZqVXMyR3QyZytJUDZjNjZrYWNNN2U4R004aFo5QXpXc0RM?=
 =?utf-8?B?Znp5TGxRcjhaWGxCNER4UlZsbDN3N1NzT3JvUytkVzhLdzJQZXlhcjdIZzVu?=
 =?utf-8?B?ekF1NFhmK3A5TVV6QWt1Q1NWYXVpSHJzeG1YOFV2cDJDd2x2QjF6MDJsYUha?=
 =?utf-8?B?TmF6U0lzOFArRnRnR2Y2cStqUnByZ1VjYW5uK052cmRzVks4NkMzWXpNc3hx?=
 =?utf-8?B?RUovZjJKdms2ckJJUm9aSlY1aEYrSHFsTDA1RGRQSGt4RWp6enZhZFlra0Nt?=
 =?utf-8?B?SXJ5bmZoQkN2VzJmdWxXSXZqZXJYZWo3d2FNMTExYy9YcERoWWpXUENXOVJm?=
 =?utf-8?B?TjljcDVhb3BidXVvb2JaNFd1ckNpNXNUYzg2WHpsR1gvbFNnTG01T0l6c3F2?=
 =?utf-8?B?a3p3ZEJzRGNjenNtTCt5U2pGT3lrd2ZQL3dGbUxRQzhQbHlrNnAvUXNIQWEr?=
 =?utf-8?B?VitPaVlDdWViWnNMcE5xRFRZNjRibzhoN1h6UXl6NERCWlZWMlQ5L01EMlVj?=
 =?utf-8?B?ck00b1dvRUIxUThtdXdBOXBJbDc1KzNlTFZmcXBaaGFhRDVzWnEyUW4wMUZH?=
 =?utf-8?B?blZBSVI4czZoMkw0ZzVBVzZEbktVdURwRldCcnFHMjVwUnI3Z1NlN3U0d0lQ?=
 =?utf-8?B?bjFCSms5V0xCbEExN0RtNndtcTM2a0JEdGNuRWMyOVI1b1FJMWV4dWg2UDNi?=
 =?utf-8?B?TWRxbndVS285Qk5PNTJvTFZvQ2swVzNtQ2Q3RFJRTVhuaWtHRDB4UVpHUHdP?=
 =?utf-8?B?bUNIZE5zc3Voem1uVXgrVzNLOW5vVXpkMzNSVUZoZ3prRDBwMWVPTHVCempt?=
 =?utf-8?B?RGQxMjNhVUVFSVUrdGx5QzVqRk5Idk0wTXlqbG1Sd1FkRVFPcWZRblVmd1g4?=
 =?utf-8?B?andqbkFEUjhKamZDOEhKSktxZk4yajhPQnlsN3R3elJyRURsYktmODU1Rmxy?=
 =?utf-8?B?VGRDYXlTb3JBdnVubE9rcnphVjdkMDhuUStTTXd2TjE1L3VFcDU3M3MvS1Ur?=
 =?utf-8?B?VEswTXN5REloMUVvcHhwZk9IT3BiWWw4L0JqRjM3Szgzb0ZlQUNsS1FMZnZM?=
 =?utf-8?B?TXppTlFDRHhUSU9jRkc1MFBDenBjRVdzN2dpNXRxdDBQOEFCblRTL1E0Vnd2?=
 =?utf-8?B?ek1HSnhvT1dXUThjS3RwSWxBbEJBbG9yZ1FCSnZ4eDd6cHVySG5WTHdDNWNl?=
 =?utf-8?B?bzloTmRITWEzUDBiZzN5aEg1WlpsVkRUeEI5TXdOdi9JTUdhUFFocXpqL1lC?=
 =?utf-8?B?WGxWWmNYODQ5ZmRXVmw5aVVnZEVhM0p6bEJBYWtzYXJZWjk2WDV0V253NHB5?=
 =?utf-8?B?UEc3KzlwdDN5OC8wSGxPeHdNQjBxRnhoaGFOMnlZUlpHWXdGclNVd2p5Ympt?=
 =?utf-8?B?SUdwd2labmNQTUlYcTNEaXFtWUpMT25Zdm9NUWVmMDhtRU1HMzZxdlFTQlo3?=
 =?utf-8?B?QmxDcnMxcmY4Z25wVGF4MWR6ZmJaMlFTNHRmb1JLVzJmR2JhUmJzQmdnODAw?=
 =?utf-8?B?Ly9iQkZhR0FWYkhTcHMxZld5cjBCTWJ5cTVqZlhvSURDTk5nV3ZVTjhhSk1q?=
 =?utf-8?B?WUhBaVplV3c0ZTRrczJwaTBOQ0VaVlJud3BGOWxkb1pLRGhLZnpjZWlnQWNy?=
 =?utf-8?B?WjZZbVg1OUhEOVpJY1JBNXlRcE1za3lLVG9WUzM5NVlTYUVPZ0xSL2EvbmhP?=
 =?utf-8?B?ejFidUlybTF0cGp5Q0tkcmNjTWFhL2NGbTBqbjJ5TWpoMmFIRlpodz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd4e1cd-5d3d-45c5-a9b9-08df0a7615d1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:17:19.9785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+rlXgDLkDtV4GcTat6Cye3grQpzgQfYHPwlM8A5CqjLIxdOoLP08iuddfhrGOADm0Dez26uxdXgn7KcT6D1wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2542

On Fri Sep 4, 2026 at 11:53 AM BST, Alexandre Courbot wrote:
> On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
> <...>
>> @@ -838,23 +871,26 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeo=
ut: Delta) -> Result<M>
>>          let function =3D message.header.function();
>>          let seq =3D message.header.sequence();
>> =20
>> -        // Bind the result rather than returning early. The read pointe=
r must advance past this
>> -        // message on every path.
>> +        // Every path must advance the read pointer past this message, =
including a failed decode.
>>          let result =3D if matches!(function, Ok(f) if f =3D=3D M::FUNCT=
ION) {
>> -            let (cmd, contents_1) =3D M::Message::from_bytes_prefix(mes=
sage.contents.0).ok_or(EIO)?;
>> -            let mut sbuffer =3D SBufferIter::new_reader([contents_1, me=
ssage.contents.1]);
>> -
>> -            M::read(cmd, &mut sbuffer)
>> -                .map_err(|e| e.into())
>> -                .inspect(|_| {
>> -                    if !sbuffer.is_empty() {
>> -                        dev_warn!(
>> -                            &self.dev,
>> -                            "GSP message {:?} has unprocessed data\n",
>> -                            M::FUNCTION
>> -                        );
>> -                    }
>> -                })
>> +            match M::Message::from_bytes_prefix(message.contents.0) {
>> +                Some((cmd, contents_1)) =3D> {
>> +                    let mut sbuffer =3D SBufferIter::new_reader([conten=
ts_1, message.contents.1]);
>> +
>> +                    M::read(cmd, &mut sbuffer)
>> +                        .map_err(|e| e.into())
>> +                        .inspect(|_| {
>> +                            if !sbuffer.is_empty() {
>> +                                dev_warn!(
>> +                                    &self.dev,
>> +                                    "GSP message {:?} has unprocessed d=
ata\n",
>> +                                    M::FUNCTION
>> +                                );
>> +                            }
>> +                        })
>> +                }
>> +                None =3D> Err(EIO),
>
> This error path is the only one without a warning. How about:
>
>     None =3D> Err(EIO)
>         .inspect_err(|_| dev_warn!(&self.dev, "GSP message {:?} too short=
\n", M::FUNCTION)),

I don't see why we want to use `inspect_err` here (just to make it an oneli=
ner?)

Please do

    None =3D> {
        dev_warn!(&self.dev, "GSP message {:?} too short\n", M::FUNCTION);
        Err(EIO)
    }

Instead.

Thanks,
Gary


