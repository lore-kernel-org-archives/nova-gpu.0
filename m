Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361377;
	b=bULrQ0NFjcvivQxy3G/d73H3B+p9XmH1osjkCHbHsZ5sjFgoi/RCgr3+i2QXWxGyAx09
	 pXqVaCWZdLgaQ3DSxkjG8EUahNql6MIYc6MfW0vVEL1wS9cSv0aAyVg+65iQ30Xkw80Wf
	 E0jFWdbFNnt6/iwCi+umOC4HZuMhMaHv8o2rHPpLGjrQLel+dZmKzOyIFe4rt+gei4d9v
	 sUyr2B2ZUe0zzXVubiS+1OlWqDGsviAsx/TUdJ60Abs7+eG3a0hJSVRn17SEXozAClgIa
	 NRGNfqmXWkPjFiLOkQCbsXz8fo11PXUQWFw6KEkZ1HOr/WygfR8sWelsMQDtMRkQ+0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361377;
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
	bh=53ark+vV+KtpyXYNv9LIDptdF+kjo1LBcLywnGAgkEo=;
	b=ufyfOG8APE+49IonMpQ9vD0a6D2TZGnpfqpQlS2XS7BQIp9w5umLXtkLkPPtzplCsH5J
	 Bi1w1dlGJWlaanR2wWtd5G7dYNcSKm0XHIt1grwAGb3Elm8I2fYGzopd0uQH+K9YpHZ/8
	 IuM2ACZpWpDjeboAFcQY4RJCtgo3eSA6IgaisCdaTV5QxVP9X6dv6j/XuqQwldeMIH7hO
	 Dq/+7UMfNVSlorA/L1647mkazndwoXqJqriD1ITfKGlOq+MOeOM0QSsdHaM1y2RiHj1ou
	 7i/NB6bhQvLqq+Sh4KwIGZV6JXQOQYwu1vOivlzRy5wwywO5dKdUrkGKFuuZjtnPnQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PojZjwUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.28
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010028.outbound.protection.outlook.com [52.101.193.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B33606A327
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 01:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B33606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PojZjwUD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYkG3rcdtjyA4XIaiTk2e2aGjltsiEgn6hRXBTnfWEaL+5sLsrO7rw8rEyNiiSPZ8za7niisuKLQK4cG4zTgmfJqQ9DvFhP8S3MmoZno2TmwbLVX0L4rWoPxd9eXVHZK5z6xVe9suyckcSnEnauIR+Ub4o85PG+TSvpi4AfY05qRA28M1C/NYSows60sP/YqCwXxSIdhsueHGKt/nkD5Bsf3GEPfrBW/U60hBmKnXBFftzQRKHb0wgy6TDQzNgs7vk1yqAkSO56XQR2nQ8L8eyDY6nu6TwoYMaQ/o3yTObBEBFBJRK0KHo1jcw9j3TMpGlNlpQSTbMjXRwi5sPkPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53ark+vV+KtpyXYNv9LIDptdF+kjo1LBcLywnGAgkEo=;
 b=wWKpV/qV2T+NCxB3RuCmUR10qap9rzCb//p1KqVH3CDh8higxUvagnvyx3i/UQqobRTYlgiL8RkPsQwwlNPDC2ceAGlLBVocIDsoT3KEG8bOx68nQnITdiZK9zpnhnY/fxCwZ3tnhbFBdEfmeFFi8kuEhc3wCh2EFc2StSmcGwwb6if3i4WF6jiFbDk0f6IsAMlELg55fYbnWDJPTaus5Ew8aZBz/cVcEAJqokzpzoMBrQoVqNmdfiUq3NtELs8bwJ/fSFAt2Aji5NjKfDAsUyNobMz3xHspT1q+2jLzhAp/OqKs99B6C4l5GaRfdz3jwHO15Y4cdw5PuTdASuhHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53ark+vV+KtpyXYNv9LIDptdF+kjo1LBcLywnGAgkEo=;
 b=PojZjwUDPxfDmQqya/Ql9/lz0dNDtZ3AZqp4p9c2y6dFqkhQlxA1ahUeKsWqkI1wsirIOtqN+r2YGbyI+FCMrXUEuc3m5c8UZCNUJVmwkhwrOqOSGSyzptcHlFcmI8IxSatEXtya4/mQt8cspLBb/eL3owZwGEZhexnEjBRiDaIfO2pF7z+fAq0yXUL85MzA5NUV9csi2J/Xg/6t/pJ090Noy9cGSWVnND5IhKwnRnvPtzUmdV/lACIqRGbB8s2c2FVdaJyAIEHS0LhFNveDSMS4vngnuhJmIVvWOpCt2ePunS6Eh6IVlbz66pKN4lcP9gaRmabBS4bc2Wtd9PeTLQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Wed, 11 Nov 2026 01:42:52 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 01:42:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 10:42:49 +0900
Message-Id: <DMS00P2Y1GKK.33SZY761NN5ME@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/13] gpu: nova-core: falcon: allow DMA transfers to
 read from a framebuffer address
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
 <20261110-r000-fw-v3-10-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-10-20d79ebb646f@nvidia.com>
X-ClientProxiedBy: TY4P301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::9) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 293afea9-36fa-4a42-5e3b-08df3f95198c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022075727099003|261102123227099003|261022115727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	trAgM/i3xI6CqGreMk2z73IhrG7TzTQbv+At8wc6yQ1KkXVj5CfIHMD7z+3+0U0mQv12S/3HskfIWZS0KXEHzfZpM4kH4BHuwCdYQJootp3K7PVgobSCChCLFjzzk3V+wx/vKkNmFjUzniSYYNwEsAZ2GyJVFzEFC1t6a9f3OvkULf3AT6MOdWdOk4TdG74uq3TXr7dDI6VJI7Qxfb2dSVynwghznFVIZmVIF1o51q1leGCI1o46uHzIb6wyQ//1lhNw7zIAu1mvcpW8Bz6zbpGy0sxQSzLAOSiHzCjaP3OYuWfxdMg+g7aAHghENuAFo0Dfn4+pK1dP+uOGGRlzWXTqNE3DXOLILliT84rsS+D2JzW9UZsjkB/ihkJKva5RHpFdRtOv9GsQS6TI7vlFIMF41r4Mf7FsRL9prDmZwxEEzGrhfcb3sUWXUH2S1GvopftYoNSJxUrkrhvDq+7gGjpcjo7xpdl0gbuflx5dIRmTvlWrJFy0X3sDghrTkTwLuy72sMLJCJzgkib9WI4IyrN38JgHdmoU1LPyRwa8ZSRRq++1u3xWPv0L824I8vTppGklbSw6MsXbJY01y7rhbxyiCCpjksJSdy4ijdARMq+quu1vF2f7Z1vR1YaxIjLf1LBiwtQTVbveAkslDfbUoIo4Zro84yuxiQV1mFm+PRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261102123227099003)(261022115727099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWFWUnRTNlF6QTM0WUlEc0hmODY0NGhBT0lhYTY3dTRrdnVxL2R1Z0hoVkJm?=
 =?utf-8?B?YjkrQ0Y0b2dmQnJEYk5XN3BXV2d3NHRsR0s4Y3Zpd25PWHZveTV5U3d2RFhq?=
 =?utf-8?B?N1l6TG1WQ1c5OTl5S0tobHFRYis5MVNTeTdwMGl3T1pnU3FyRjRQQmtKVGMx?=
 =?utf-8?B?OUkzWEdPY2x2eENrSzJ6aDh4RFc3NGpTbWRRSkoxT0h0NUJSWjVQaHZTc3Jx?=
 =?utf-8?B?ZFJUbFBkbW9LT01tYmFmb2F0c2ZKaXE5cjVveGJwdmZnSE5mSUtuUndlU1FK?=
 =?utf-8?B?ZnY4NUxrTDc1NlpHSjlIUm5VWjJzNXF4T2xLVlJDQnBiRXVvWlhvSys1dHZr?=
 =?utf-8?B?K2xsQ0Q2b0w4aEVLWlVGajFaMy9QZ0FhYlIxMEpOZXNwTHQ3QzNIajkwbUFs?=
 =?utf-8?B?VU1hRmQ1Wm5tcFp2ZFBrNVFKNWhCOStFUFVEUm14QmlQMEJ1OWZ2VTNjenUx?=
 =?utf-8?B?Ti9qNWZPcWJ4NHN3ekxCVGNVSWc4dkZVWHJMRlY4Vy9HZ2VZU2tGV0FQK2Zv?=
 =?utf-8?B?b3ZXTTJNblRRakV5R1kzQlVPcHNURjFBNnJjd3QwRUlpMGFHK2ZUbnltc0or?=
 =?utf-8?B?N293eUJrZ211Y21HS09JVkpINzJwSEIya0hyUlNXaE9XalBrVmxDSGJpdUxk?=
 =?utf-8?B?SlE3aEsrWUViS1Q0NkI5K2loYUZaOFBLeksrOVh6dGcyNkc4ME5BMEtYOWhk?=
 =?utf-8?B?TExUSWlkSnpDTkRDSmtWNGYzK0Y2bHFZcFdGOE9uZHFpTmFqbGRubzdidmpy?=
 =?utf-8?B?MERQbitPK1FKdGxvZTlnZEQyeUt5WE5TL1l1RFVYOUlQSUd1UUxHandCbDY4?=
 =?utf-8?B?UW1OUFFqRHlCRlJQZXZ4azU2NkFuWE1QeTRmRTNJSGsxanRMM0gwSDhOU3A2?=
 =?utf-8?B?L0xjNGFzOXBTN1hWZERzbDdZSVZ2WExTZWFaT1l3eGNoOGpKekFqZ2d1dHFh?=
 =?utf-8?B?eVc1dUxlbzJKRlVUVEtwOTU2RVkwQlo5V1JWOXlSRzE5ZXAySDBOUEwrUXZa?=
 =?utf-8?B?S3RvbWFwSFg0TURreDlsRWVCVHdqZ2xhdzJnTGJSbUFiZjRsOEVTY1BCYXpO?=
 =?utf-8?B?bGJzM1ZqZG5neUsrd3U5SVBBdVovcGQ3MHdxVUduVnRpYXptTEZ6QjZaeDZi?=
 =?utf-8?B?TkVuUXc4V25kdFFkckl2dXFEVU9qQzYxSUd3b2c2WFdLeVBhU3ZMSkpTZ1Rt?=
 =?utf-8?B?blJDeStIM0N0eHpwRnhNalN3akY2cDRlbVdmaVZoU01yVDdSNFF6SDBvZTFw?=
 =?utf-8?B?bXU0ckI1ZjlZd1EzKzFaYjFSUzFVUTJ5NE1DTGREUWJ2dXFMR0hrSW1qak05?=
 =?utf-8?B?ZmhmYzYveXRhRjZqMDBhUllUNlBHTzdCMS9RQVNRdHBpZWN3SEdwNUs3U0pa?=
 =?utf-8?B?dXFhWm5ZdWx5T1RYa3JRd1dQb3dydS9ORnBuR1Y1dERTQkFrcHZaRGoxb3hJ?=
 =?utf-8?B?NVJvZEJqOEFUOGwxYURnVG5QYUkyVXNWeWdjM0RsNHpkYTlNaG9QSFpRM0RF?=
 =?utf-8?B?N2h3SUFQTEQrWVY4amtPSVY3V25zTEZHRVRaeWNnZE9pYmtXWlV0OWg2S1VM?=
 =?utf-8?B?THRXU3BVSmpmMjJYYlUyN29NT1YwM2dBMVhFcyt0SjNSSWJ1VEhiSUMyRlF5?=
 =?utf-8?B?dm1CczdqSXh6bE9FRzNQeTRPckZyWWpsYVdzQmdDOG5zb1QvSXpXaURQQXN5?=
 =?utf-8?B?aEx0TGowNndmZXVCbVFXWkZGUWdqUzZjL0YxTCtSNXpQeUhGQ1Q1WkFoaWV3?=
 =?utf-8?B?bTdsNEd2NlhTZTd2ang4RlQ2L1o1b0NnUmZ3dTl0SWgxYVArT1hHRkQzOEJn?=
 =?utf-8?B?RTFmd1JiN205ams2MTJ1V3AzcElMd0ZJR0hZMU5pVVd4TjdYWDBTZXcwNm9K?=
 =?utf-8?B?bjFOWDhBelViajNyUjdyb3pQWXAxUGIyUmpPQW5IdEFBMGJUZ2pldWl4Z2ZC?=
 =?utf-8?B?UVlXMzZLbDhndmQ1aFdUb3pyVGl0cHNXbVJIYlk1UnpjMlFrWDA0SlpkVnQr?=
 =?utf-8?B?WGtYRllJK2hkekV5STlpTXBIbWVTYWcrSUpyUUQxK0NPRG1McFRDZDA3bEZ6?=
 =?utf-8?B?R294TG90emtyamlqVld1a0pZckRyZnBRaUcyZmZpeFBBOEJMbFpaaGMyTS9i?=
 =?utf-8?B?cVVuMGtiUll6Z3VhVDk1ZG5ic0lnalo1MXVSQUE1TkE5QkVCYkplMFFVMnNj?=
 =?utf-8?B?NjQxL0tEajRSWXIxbVNSMHovdWhENzRDdkw1dEZCOWdUREZwUi91OStFWGlG?=
 =?utf-8?B?TWdxZjJ2M29mUGRrMERCOHp1SnlsS0Y5TTVMSDJJTzB5UkExMkkwa05KaU0r?=
 =?utf-8?B?aDFMQmhONDhPWXJYZ3NWaFM0Mjh1alFPamFQWWl3d09XZ3AvU0srTm5abmtE?=
 =?utf-8?Q?uO0oz/U95xYD9pU7M/VPOzlHlzYdRcibnlG+gNmeMQxhP?=
X-MS-Exchange-AntiSpam-MessageData-1: W6Iscuyz9GqSTg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293afea9-36fa-4a42-5e3b-08df3f95198c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 01:42:52.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iP/v6lSQlORX9fZTTR553vsxk7rhWC+3bpIkNGs5LbqkffWtZitE0ZDqQmLOEVDG7zckW3oA2aIYASFeMFrxAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655

On Tue Nov 10, 2026 at 7:20 PM JST, Alexandre Courbot wrote:
> The r000 boot protocol has a load-and-execute event in which GSP-RM asks
> the driver to load a Heavy-Secured binary from framebuffer memory into
> the GSP falcon's memory by DMA in order to run it.
>
> Nova-core's falcon DMA loading method currently only supports loading
> from a DMA object that the driver has allocated, so there is no way to
> copy an image from framebuffer memory that an event supplied.
>
> Address this by making the source of a falcon DMA transfer an enum,
> which can be either a DMA object, or a GPU framebuffer address.
>
> The framebuffer address source has no user yet, but will be used by the
> r000 boot protocol.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
