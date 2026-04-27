Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021098.outbound.protection.outlook.com [52.101.95.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1072FC00D
	for <nova-gpu@lists.linux.dev>; Mon, 27 Apr 2026 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295795; cv=fail; b=FFTHXlaIs2A3u4IyxvcoqqByNUnzltq7ejJaD743VPOocc96o72ayqsboP629ZucmQHhekwLCC4RMlYsM17Bp2KhLg3edZVIcAy/jqYtkTms6ltNxWdirPG05ioEuweMIh/ElHPTHQ8LwOXu3V6M8myv4lBkRTSxKy8gOO0s1sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295795; c=relaxed/simple;
	bh=zya2UYNr+RqKcpe62olgjaUVuSVk1qX837RV9CFw0B8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=twUH1n845/9ZXT0AB1EmPltj2+rN3bMKg//otlG6KpNyd6+Cl5F/NubjOmei1Dk8vpI0djFMxldYfUggo+0D4Svt6Pq21cG2T1scXpy9ldNJZ62TuEzU78n8PGLtac8F2HiUYGiM1YPVT+qvpKEXSFPuLQXBAjTct6n20/ldy2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Njl1OWmc; arc=fail smtp.client-ip=52.101.95.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Njl1OWmc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1jFi3tHrz4U2si3wMVKG4VKkq8T+pQE4+DUYj99Tsnd0wfRHQsLEGUmBZ0oh8A5Xs54mqR6SPiHMA9dlf7aCzjUtgQmdFeF1ZwNlTta0tFLF6i9hTHD+UnM1kOPDBcY3/xSbaNIF9uu2axWTh/CQft1bIanfD6bmh+zOGVrHW3yskLPmvL3LRHPj80WcYy/cKIQ9eKW31R5Fjbv7GkVPZWfxJRyC8j6FRo25Rs6IwK+IPzcl2Xfku4345Jfe5sB+H98UCKMBt+tKb+3KK5q+9o4pbAFc/cirLObvEj9x/GND3djf/4DAsfUUscZ/KS2cIUA2UGfP61/mevE5J9fsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OtCylJ9kAyuzrUrv6W1OBkSVVRNf5d2RyIJA3tv6Io=;
 b=dbnzTH1X6Mye5rTLsDRTh5Hy9AfIQHGhe2oHpM4CytxQjsuwR8oRxyhvsLC93BQSKwPlqm3RtFAbfCMJJuRiyFVyqn4Eb2JFD5gzWjgPMK5pLhzFIGYUWjkqTqn9ZVtaK0BhUCKX8R6h6KAQ63Ximqq7rjdnkO0pDclPIr+tqYlbNH3ewXiW8jkl4+NHaYGLlR/VXPKuP1FaZYmDvty/h4BxOJggtmNvMZ23KlK6cnNyx8wMtXdxcr9PkSJcb3i+U52RVGOgp2z/FBR+G6pq2SwRjIUQbj9mPbr11UInM12ByXMn6lZj26X+jLyVMV93RCowNm/xF3sSIqgZHfsLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OtCylJ9kAyuzrUrv6W1OBkSVVRNf5d2RyIJA3tv6Io=;
 b=Njl1OWmcY5Uv7Tgv0/PVtnSiAD5NSro3nk+7K1h52kW5RLjZSccGjYetWdtFy1u7ju3GF5gMg7cnyWq/io7DQ7ob8CY8iIEfbfZLtGKaXNtrjo8Ro5VgcpQb8PCG6dIDhFBCgJlLbuT+Rw4YofI0jq2N2uTKnsXelBQHt+vHKh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2272.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:111::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 13:16:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 13:16:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 14:16:27 +0100
Message-Id: <DI3YRXBIVAA1.1KLJUZZO6MPAX@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 1/8] gpu: nova-core: remove unneeded get_gsp_info
 proxy function
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260427-nova-unload-v4-0-e145ccddae66@nvidia.com>
 <20260427-nova-unload-v4-1-e145ccddae66@nvidia.com>
In-Reply-To: <20260427-nova-unload-v4-1-e145ccddae66@nvidia.com>
X-ClientProxiedBy: LO4P123CA0356.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2272:EE_
X-MS-Office365-Filtering-Correlation-Id: b277850f-7289-4ba3-90e4-08dea45f30f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aaUkviIoEzLox4st7uGaxFu8QRBHLTdDCMs+GKbzJYh2NJwEdGRMWOCzyYIc+wQpTwFhcBZHXKDmCmtGvzDVuFBuxKAHvto144jLYPjZVkkTLilawRfyA1gW3ev7TjKR67J/VQurbqnjjPQd9iH9HhHaa00VkNVDvwizPEHs12lsoiGc8kwo4cs2/W5lWEYDu85B6n/zkbc4Rn9Qbe9vhDTgbWyNaDR2GtF8dQmG7MsO3CPu1gtKL+UqLu2YqpS7wp+n9EnBWbsaGC7Mqt0TX++yw4vG0hf+Thn2EQDXSHpLSWkFyybrJHGjusn1e97uVNL3h4BRM/3UD4HPynFg1LZIN3KOM5kSe+fLcbdUnCCyWk7nbtmFjC9qPjG4Z8AKqRMo1qZd04mxRjQ5+k2CYgRyKC8cVw3Ryuh/k/fWuK4rZofH/kP9Cek2oSeqE93T78NCxICMHyi5E+DfJeYDyF7Q/9MEUsEnvRPzrPEM5Uuugl61F6uYSwIU6b+zpr3TvjjDCHtuljWkWE7vkViGiruIhIzlyySO2WrmS8VBrCyhHWqnxXu+adQHDHjiTdymqQJ8NmYstpL9R7s1AYx21CMD/Co60+n6kceW4OT9GbjsEkInLslpPQIo9z59rMsBVA6ZX1FtNOwDWsZSbWnnTB8DG5cW7vS8HnqigYX6dy1bZHGcRU0I0Er+T7GcCl9XisKREaWjvogs7b0gpec0cWOPzuRy8ErFmE0Z1gn8/TU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0didVZHVUFFZFIxbzA1NS9rV3VEVERRTnBSL2ZucW9vM3JYL29nQXN0aEpo?=
 =?utf-8?B?Z05XanJ1aVRkMUlBc28zWXYrb3A2OXZrY0dOd3FDRTRJa01vanRzZmlBVUIy?=
 =?utf-8?B?cDliRFFDUGl2UXFtVTRHOUVhcm1qQzVudGFZSm5zay9BdDZUcmVCaVRHQXJV?=
 =?utf-8?B?OEQ2TzdTNUtTVFJRTnRYSlEvWVlSWk1ERXJaQlZnU0Y1RTRzb2VCcDI4YWlU?=
 =?utf-8?B?TjI1WDgyMGtGSzJWdFNuOVo4dzVNeFJ0ZVNWWXJ3M2k5aDRyNFczSGVBQW5y?=
 =?utf-8?B?KytkeHhMcm12akxKY0xuWDU1Uk50RXNPekxnNGN6cjQwMWtqaS9samxEMlh1?=
 =?utf-8?B?NWRDUkFTeE5STVExZlYzS2FHdkdpYmc2QkkzUE9GbjlUWUxObkFCLzE0UHAw?=
 =?utf-8?B?VTkyRURiamtlQjByR3grM2JDeGo0YWdZcm43VmJGWDdkT2QrYnVYQXhuVWMy?=
 =?utf-8?B?a3NwV3d5Z3Ryd3QrMmZyZ2lPUy9CSlVsTndFWXNqM2xuS2ZYekVrdVc3Wi9t?=
 =?utf-8?B?YXpCbXlNWUMvY0JUQXZLdzhKaEpycW9saUxweVpaemJaa0FkV2wyZ05TSFJu?=
 =?utf-8?B?WkZoTXdXNzg1aC91Q1Z1bEl6TGt6ZkFoOExXWGxteEVoeXo1Q0NBTHpHc2lN?=
 =?utf-8?B?YmF4dmppZ3R3MStNSEhKQW1FblMrZlFGUjJGTVJxZkpKZTQ1Y1VOOFVKcGU3?=
 =?utf-8?B?U28wOFBsVVc1dEh0VDl0b0lndFROeU1vS3VwV0ZaZTR5d1BaZEVZOHFTNDBR?=
 =?utf-8?B?K1NDcitKQXNGcDlybEhFbzN3T2x3NGVoQjhvdnVhd0hIOXptZlp6VGxVemhX?=
 =?utf-8?B?MTR1djlQZUh0UVJDcCtpYUgxQXZzSldTNG5MdHdUNzA5OEJSZUtuaHZNY01I?=
 =?utf-8?B?ZHROUWNaTlR4a3BKbWRpR1psUm9UWUdYQmtZR0wvQUVTWmxIVTBnSWRNb1or?=
 =?utf-8?B?Tmo0MHI0K2dnaG5pZnZiNk9FMlg3OVE1Z21xcktXU2xLSUM3QWV1b3pHSTVx?=
 =?utf-8?B?blRLRi9sWXI3ZHAvY0w2c3hFVExhN1phaVNyQVFQQ0p0bUxqSmpDSzhsMkFZ?=
 =?utf-8?B?TmFqei9OUTJQK2ZudVdGdmVxaG9HR2t5eHNlZ3lrOUZWZSsxWU13STVWYS9Q?=
 =?utf-8?B?OTh2VmFqNXM3clp0dG1xVlNrbG04cVdvYXc4K01VZzdJdEZaQjc1cjRKdmd4?=
 =?utf-8?B?YVpWdEZMVVdRTFBjeXZKWStvL1JQWWhidXpqazNKWkwrWFFGTkE1YVdrOHFO?=
 =?utf-8?B?T3QvYmtOZ0tsc0FTeXJ0QXFKeWhmWVVsenB5VzR5Ky9DUStvWFRRNGxwSzQw?=
 =?utf-8?B?MzBwZXJ3andkMDl3NnJjb3JrWmthZ0dEaW42R3g1eTJjd3RhNi9CWkQxZytD?=
 =?utf-8?B?QU5JUnZ6RU9XUStwMXJDbTZweEtPNzNCS00vMXdxVlU3NVNsb0ZrT2x3WVJt?=
 =?utf-8?B?ZlV3Wjh1VFlGMzNvUk5hT25HUnM3NXdqdlpJbWlBQ0l6ZklId1M5cmdGOEVE?=
 =?utf-8?B?QWMzZE8xT1hrR0NJWThJTmRSUEMzQVl5V3hnMnhGQUUzd0tVVFlXTlpoSnJV?=
 =?utf-8?B?YXJNckV3K01aZGEwU0F5Z05zYjNkR09acE13MEU0djVIeU9XaC9UcDZIMG5N?=
 =?utf-8?B?WHltUHJlY05tT05hVUZlcFVuVC8xUzBlS3FDTVNNUW1FWmtZOUR2V0VGMEg2?=
 =?utf-8?B?V0x2SUUwQ1JNMmNZTHFya3UreG8yc2dKZURNc2NXK3JoQTJvd0FvaE9EbUtw?=
 =?utf-8?B?b0tQZUdKalZGUklSVlgxYTBIeVd5dGVyYS82SWVLSFVlY3ZUNXJETkFEbFRx?=
 =?utf-8?B?MGlrSVAvVTVQbEN6VTBEUjNiRGxJVXBCWkpuelV2dTBNRG0xT1FMbE83eUJy?=
 =?utf-8?B?dU5YQStGRzFHWU1tRU9ySHpLVnJIMXVaNXJUQ2N6TDV0L1hQRXl2blcvWXZx?=
 =?utf-8?B?d3hYbHpCSzRoTDFZcFVUWUk4c21SZDR4bXNIL3FvclgzaTYrQmVKb045eFI3?=
 =?utf-8?B?WnVkaU5TSGpaMWcxZzhCZTBNeFJsNVVvVFFpVG9sT1E3dXc4ekFvYWxXR2Iv?=
 =?utf-8?B?am5XYmI4MmtySmJqWk5DWkp4VGxEWTRwbGxEWUdCbG96SzRXOHliTUNlbnJX?=
 =?utf-8?B?bXQ4akR5UlhQVEExc0d0MlViWmtOVUFtNHVrNlFab25RUlRHd2toK0pSaHlZ?=
 =?utf-8?B?NEM1NVR5bWg0NlZnOXlvbjh0OHoxalNnTFRGL0x4RldxY2xoYmxWMUtGWkpv?=
 =?utf-8?B?VXJjZ3hIZGlEQmFwYkphTDlZQk0xclFoZXgrdDJtOXpCMzBVQVZ2NW10WHkx?=
 =?utf-8?B?cUJaaTdIZFhkVCtia2tmNm8rMkpmRmo0MWNhU2RObzNkcGxKMTJMZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b277850f-7289-4ba3-90e4-08dea45f30f3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:16:28.4056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZD+7Q1hL4yKtZ5sJVwgIC4ccIJs+9+KD+B2CHPFkI+XYn0H/F+4K7GJEClaQhsQnaRXDnBonjFRfZyoHal4Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2272

On Mon Apr 27, 2026 at 7:56 AM BST, Alexandre Courbot wrote:
> This function was useful before the generic command-queue send methods
> got merged, but it is just boilerplate now. Replace it with the correct
> sequence to queue the `GetGspStaticInfo` command directly.
>=20
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/boot.rs     | 2 +-
>  drivers/gpu/nova-core/gsp/commands.rs | 8 +-------
>  2 files changed, 2 insertions(+), 8 deletions(-)

