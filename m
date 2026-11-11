Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361387;
	b=j5B2px7TSYeWhlEbxICCTfYX9hqEhUtTdl0rOBrc0YvQZ2vf6f2+yRioOgkF8VT81azC
	 MCJdWFF6FH+wtbFRZ5DdaoGDnN2kCsL4xKC++93kmfFeqVwMBKMqr7I3iVHdvpFHei+PT
	 u4ID3TW80ph6vh/Mj+PLhIHrOAUwlkJEyLsBKucx2945KDAdU5/0iaxmNpNaqIx/Rg/Ua
	 hMcamyXaAaWZgY/yqsytnBwNAysJGZb1lWavouu/MLlFFx7lIUVStS/dulSLOimpHUF7T
	 7L47cUyOSImWu5NdEJopUZOhDClvyxIaxury8QTkdtOysSdjTfTFx1ruCOR9kZqBXtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361387;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YS3bWGrxG3x463O8Wrtg2nMF6QYvyzBdrJiypuYs7WI=;
	b=YT8Svxm2JvBv1uicffVclbdXFHBQz53+0nMkQ7XrMU7nvIAknARsvPhUfus+Zi5Q8Mbj
	 7fWQpElCPUOES+e2W+yZOIXw75wg37N5fu8FSytFfHinJ76lF0j1IxzaJlwlsrajxSgB6
	 Gi0fW8PB8cbb5QnFaRmjBzcycI7KO2YtSRVGYcW8DrvfYx8p5Q33KQbkZB3EJ3CiMH8TE
	 fLnOih5aVVcO3t2hmyd+IHp5Y+2lwpiAqDFwPA7N+Vdx+HiSXRrn4HrZCS7R+pCk1vmnL
	 voHoqVonT1dm+8j4F3jIjWfWViuSExS+5UVjkwPHLw4feuhhNN53010EdUrpgNvM/bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e1bQnemM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.54
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16139606A31C
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 01:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16139606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e1bQnemM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azfFI3j3z1SvWXwZAieDnh75Nx/GinKeNwS6IpmQoIiUVikqC1UgV+efaaDULUU/9nsSYxmC/aSMvyemXCGzhosRKF9P574L7JMde+ORFbJn5zgUvF+s6/9Rh11dgZiDGsM5f2ws45k5tC8d0OWdLfCSjm106gq00c07bokLKeZ28qCFe02zJvgVcs+RzKm7o0x7D+m4/K50d2yX2HVXBY8QSF3DbZmcLcMMZVM0x2uIfIu5qC26cI0wX3Gufk4djfboE2SCGCQSSaxi+Jr9H3oEP+aeLSxOPmCOfaQWfoUC87AZ2xb972fItUnfGiQh/81v/bfcG0TftHFmwG+Ajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS3bWGrxG3x463O8Wrtg2nMF6QYvyzBdrJiypuYs7WI=;
 b=TgGShkXi0mGzoa9heTJTuBy0qiB8ZIuO2tR8+wr4p/aj7zsiuUa+mOCEl3x3lxA4y8WOIfBnKSCtLhjbXIkLFZZqc22/MDCLUBWxV31dfSWJhzGWsqSyMfddLpvZjmc8aq7LU11gbFvRXYZopSs6HpZjiZGQRGybXdrU6nCavy4HdZtYmY8TgH+bfSOt7q2hKBLYiI+VXTvMHseLEp7w30PKFwetQyh/0OntBL9m2lvMZHJcm581wIkF5NNdN1/14y1PDMSV+oXxZDpvhbOL6VL5xSur/dSQ/41Wzx/TtbkEkqrERQ57aIL7EXL/HuReGsPiIDFU2d5t3E/sENa5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS3bWGrxG3x463O8Wrtg2nMF6QYvyzBdrJiypuYs7WI=;
 b=e1bQnemMRrK3DbBnNyJbw3mtsufIJCI/Ch4OfFi9YVmqUTJ2qYJqRlJ2a+ow6nmrWiZ5cVr8VEtoN2e8yApOmb5sKuEvGipLsw8EdhK5gDIZT5UFawoAKh+gSscdn/ce28ifuJ+jNcRGSmc9Dr+XYJk1y0e8OHy6vXukpUzLzb1v9snycM/ESz2ZU7az/OJCLoJCzAdgA9JgtUTtBzSap6cUcR0XOohE7D/7Ay6rQyXu68RmIrx/J1EUnT+FoZreazXlzudzAG3A8TrJ8gyO2SPqthiCJTkVcJeqNcAdTkFH3uTQT8GYTzyDfUIbF+jCTcgL/wnLt2kEdSXYJM1SUw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.12; Wed, 11 Nov 2026 01:43:03 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 01:43:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 10:42:59 +0900
Message-Id: <DMS00TURM9XI.3NQH0FBEQRDCT@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 11/13] gpu: nova-core: falcon: use src_start as FB
 offset for all DMA transfers
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
 <20261110-r000-fw-v3-11-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-11-20d79ebb646f@nvidia.com>
X-ClientProxiedBy: TY4P301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::7) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca10b66-6af7-4f02-3277-08df3f951fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|366016|1800799024|11063799006|4143699003|261021121427099003|56012099006|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z2hLm4GHqBHyMlFab2VUJg+y/Z/K7StusWmxhjFHBH6lD3cMWhmnJZrPY2e0xaPF1ViIRYRNxHGrbe6c9lDjRR6IPA2lcSN6kPATVvJK3qdnWv2jgOWJeUKv0o0FbeY4dDIR2Ly+0sDMKy34V7/2yVebEMjxkpxlm84Mz/h0gOas6y2Me+jXrDpGZHO6VXl5ppxKljxiFK9BBH/yflsB8SzN/fmeP8JRP9EcfBDiyGVr3AdmYM3L/+G2gNOLSo1Xnot9MUKnpsutCczH7RBJl3Vi0OdmfUJIvB8uDv++xS/9LnzkyKJLZl6fJuTk0ojSl7z0/6Mg2MyfFVl6IXNLsJcPnEyLZQqwupgQ+XA7WaL5QJuT0eE/q5B818m0g1cj7HpgqN54GV4Z1W5nGY+B0xKrj2x/9Gkrit5Sm0Eauv3oE9F4an3ZcL+4pp/ISHDPoVSA7kGi52/pIrgNkBFLJsJfEvqi8A0nIusomSSrECJT3GptjJc/EvFrF62mmCudZwSNUCIQKodeOje0OiksLHEzCQcp2cog5Rn04hKLhc2ADU3Fv9nhO5kB1ttPq33zvjqp32iMGvYvDfRjUnsGiuK62Iii97jzaQXzib9Wj5KcGiyq8XfWaOq8z9om8dc6s070eIFX9VEnRpygVZhVILnptWDXGUtVqX2/xTtWXAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(261021121427099003)(56012099006)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFR1Qk4wcGRSWUFlZU95dUpWdEFmVDRQVEQ3eUd3VDVsWW1rOVczU1NVS3BW?=
 =?utf-8?B?U0VwZmdRN2hwSCtISjRTclFLMVdlV1BZa3dMRGtNUFhiM0Vvcks0MkFyVThw?=
 =?utf-8?B?V2FET014eGxncFJTUU9XbXJhTjE0MmxIWEptNm4xd3J2RGttQ3BnaFVPYm5I?=
 =?utf-8?B?RFNBTUpIMFJ3bXJLWnZ1OXdDUmRoNWhOU1hDdlkyWXhWQ3V3VkNRMkdxMXlx?=
 =?utf-8?B?Q2FXSncvY0NQU1UxdnVsTis0N3dYY0NzQ0s0V2NFSzB1S3JDTTF1NkVZOUU3?=
 =?utf-8?B?eVk2NzI1WElGQ2FVSmZCVmFBNzlsSnVlVFREdTM3bGRjZjhKOENkaUUxZ092?=
 =?utf-8?B?V3huVXdZdzZaaFlITVdSQXlvYWZwaTcwZkovVnArbGF1bCtydVlkU042ZzA1?=
 =?utf-8?B?aVFZVmxLc0hXTDk1SFAvV0FwaU1mZi8zdE1EQXhJVEdLUURJZnRWZWsxTUlV?=
 =?utf-8?B?T3BVTEZDU0RmMDYwNHZrUmxjeXIyaTFKVzRod2Jacm9xR3FEUkpRNjFoM3k4?=
 =?utf-8?B?ZHh3b2U0VmRnV0Q3V3h1aXZDYWlKUHJJQnpxRmpvb012QUJ2bkJOR1lwc0w2?=
 =?utf-8?B?anRRWGFLTTRMME9KZFdHSks4UHhyLzZSMXNnSXFQd2c1UHY1b05rTlVqcS9S?=
 =?utf-8?B?b2JwS0VYc3ZVdWoyRUF0K2hxSXRYK09ReWZLMXhBMlB5anRPMWVQMzdhWUFi?=
 =?utf-8?B?L3JpZFc5YnFyVVl3d3c1bUlMVXluV0k0YjdxMTlxL0pYL3VUVUlVMXp3WEFZ?=
 =?utf-8?B?dnlGRjJLc21ibHoyRWFucHE2VmRoNmZibHl1cmRDSHVnbDJsa1NBZ1Z0aDQr?=
 =?utf-8?B?cVd4enFSY0RXMVIzeXBXaTZEdFFidmhRY2tJVlpEYnBFZjN3MHk1THc3Qld1?=
 =?utf-8?B?d3o0elJQOVNPYnR0NDRkSEkyR0Z0ejhaVUIwcG1pWDV5aFVQL1E5QndKOEZn?=
 =?utf-8?B?ZkY5d2l3cStzNDNnVjhZUGNZKzlMZTAwdytIMStrNjB5Qm82NFd1NENOUWRv?=
 =?utf-8?B?VGpFTnBqbisvSXNGNkhzcGVxSnFlbmMvR3IwSWlYZUloUnNUUnBTZmFPbFli?=
 =?utf-8?B?TlN5akp2YjY3MDFYejBSMGJWSjBjb1pBR0k2NGxWK1dUcjNCZm9EbFFGcHhx?=
 =?utf-8?B?Z2NyQ3NCazFCUDJiZjNaVVNJV00zMjFRcWMvYzJtOGpnSWJCT3Q4U2g0VVNz?=
 =?utf-8?B?Z0NlWi9jZ1RoZzVoUDlnbUpodU1zUXR6cmpTa3NWc1NESFo3b1dsZXdYVkxC?=
 =?utf-8?B?a3hWS2JhZFl5V2g5U0tKRzFFeUE0VjFVbitacTRHMjVXb1NVcnQ2RVBlZDJp?=
 =?utf-8?B?aytpU3pMQTJsMjBsV085S2FyUzNhSTVsNnBObEFtSW1KNDNlaVRlMjA4aThJ?=
 =?utf-8?B?NHRydGt1QS81dWpVUkMxVWthMnlIeG5POFJRZG8vM2hQRHcxNmk4MlZjQlN2?=
 =?utf-8?B?elQ1SXp1WE5ZVWNTN1VEWlluTHRLSXcrL3hGVGphN2NDV0h0MFp6KzlWUngy?=
 =?utf-8?B?MGo5b0p6aUtGQ1FubGtPcXZNUzM2a2RLdi8yK3lEQ1pNTHp5bjRMandzbzN2?=
 =?utf-8?B?TG9XakJYRTBzOFFqNTh6dzJ3M1JOQ2RmaTl2cytPeElTcW5OcFZlem9zZ0s4?=
 =?utf-8?B?bU5JQWpGQUVyU24xbXFHU2FmajN3MTNKUTB0dHVCSGs5c3hYa0RYS3IzZ0g1?=
 =?utf-8?B?VlRBZGxEUVFVdmZQbjRmc3pDSnNDT0l0LzFVNjBZNTBPZ3JjQ1pRcElpU2Z6?=
 =?utf-8?B?RVo1TVJ2TlFxVFpxM3JoZDZiblpjMUk1NjY0aEJwMEZWY3E1RkVvZmpaVTht?=
 =?utf-8?B?N1VYaGVGZjN5d2pzOTd5TW04b1l1MUZQWThuemczRjJ2QXY4anlQVk4zcytw?=
 =?utf-8?B?TTU1NVVldktObGtDRy9HNFZQbWZRVHBFbGJLbnZHUUk0dlNRRnZlSzUzRGVE?=
 =?utf-8?B?elFxaXZ3RVdlb0VmWEMxT3NheGlMWnRZbS8wb1E1WURzWEtRRTIrMldRdWov?=
 =?utf-8?B?ZVl4czdXd0d0KzQ4MXhRMmJ6c1Vkd3RCQWJycXA0ejNPWWRmL0E0a29GT3VR?=
 =?utf-8?B?ckN4OTlGandHb1ZLMDF0TnNVWnhGNDRNaDgyZWNDY2U0QUI3dXUwUlF0VEdy?=
 =?utf-8?B?Vk15aC84UXROUm1JME12cjIyS054L1I4TkMrOGp2OXdrekFXYzlYcEs3LzIr?=
 =?utf-8?B?cy81elNHT1c4Qkl2TDh6cUNXaEFlR2pzbmZTQWhVWHRUd1Y1ZmZJUGdpdkFu?=
 =?utf-8?B?RFhPaHB3ajRhK1h3ZDJucHdtNE1OWDJjdVVlcjV4Mk54ZkRDelEwYXAzT1pj?=
 =?utf-8?B?ZFNWdHc0b2UzUDhOVWVqOGdiMlhpNzQ3NEREV1MySjNFbkYwdXVIeGJmSENY?=
 =?utf-8?Q?Fpy5CHd4loWufP969swy8Co8aQW+NCsb+8k3dif70SIUp?=
X-MS-Exchange-AntiSpam-MessageData-1: y2ztB82ToG9akw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca10b66-6af7-4f02-3277-08df3f951fd1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 01:43:02.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oc1tht4vPSAxJnwYGOYJ6k2Gf+nCH1UpqhBbe/mj/K1nOUw0suFXNO6WwISmzoigV9sOK6YL+LE2UyYiRemqgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900

On Tue Nov 10, 2026 at 7:21 PM JST, Alexandre Courbot wrote:
> dma_wr() splits the source offset of a transfer between DMATRFBASE and
> DMATRFFBOFFS differently depending on the target memory. This separation
> adds branching to the code, and is not strictly needed as DMATRFFBOFFS
> supports 32-bit offsets.
>
> Remove that distinction by programming the start of the source into
> DMATRFBASE and `src_start` into DMATRFFBOFFS for all transfers, which
> also removes the `fb_offset` and `base_offset` local variables.
>
> This changes the register values programmed for untagged DMEM
> transfers, but not the addresses they read from. No change of behavior
> has been observed on either r570 or r615.
>
> Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
> Link: https://lore.kernel.org/all/DMQI0G2K6Z3B.1YEH6D2ZILRBI@nvidia.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
