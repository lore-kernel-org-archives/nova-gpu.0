Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18D48EC94
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718546; cv=fail; b=GIPLPYGlZmIJRVQAKB0IdyDM7lqqcCwTiRUA0L4rxrNk5JohR9HM3lW4WFUHjFRPOS3c9OkAhk9/tcYKPQcNPR3hGF3u/S4/HitkMN/m42yKmZBlZnJFirujB/1uRuf0PHlMLqUI/LvOd+KkUSZKE9MQs3jHGxOcqhsb4ZLhlWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718546; c=relaxed/simple;
	bh=phi9H/OgHbkC2s8araEahY37SKDubOeItsciM9c+TV4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gJdR02FAOkFkzFO+d/WFuvwJCP3AevQ9qQji+yScSkXc6bxC9s0zzNJXzeC2T/61kPNEvDo4/2UgwRyAx5o2Uo2uRHK0++VzoLc8cFqQ/TBgUkQHN0VJUzlwGN+smD8QmY20YNQph1Md8kfEqIPoaiJO0X0ZIGud84+PFSjyfb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=od+JKPcb; arc=fail smtp.client-ip=40.107.208.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="od+JKPcb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Io7Ba8hGNPd96JeqDFkVc4YHD52IvQN0bemLyYJWwOPQNI40t+6kH6Vdm6YykyoBr13i0iGX9gAhQ0g32Ro1+N9t76H2G8PhBx3zufYK86YxtyBUKlzvg2WS2fXzBHQkcf9v2mCaW3zL57msJUYweCMBYOjD/xnUuH7xPPUp/T4saTrpgVRVM8Owl+AmjC9J9nYCJ8yPAhQ1gx5F3FguJvzdGB10w7DNIXNqDXMtUuYoFR4sO7flPO/xmeJY9jKhM2UvUP8GMTT0bgM/8jxKkJXWPL2ERcTzAzOKx/KA/5h1IH0dJxbY3PYJiqFnLbFgON9XV60GieBMt0bzyan52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEZ8Gi5RsGKtUtgJPfh2lCDuAwqvk7G4DkBDYyMJp0A=;
 b=sK0GtOZi/Jw5I7NYq3efNFn4z2QCBFaX3PEaK5wbVbvxFX0y52Hx8QYXBs2vwOtzFKlYboZh9awtXcjQUwQjydkD1k6dSXuAe+N4B/hJcfFR+tml+DrfGOAXkw3OYjomn792d3L+CPzPON68MbiLdgF9cILlgoU3l3bT/RolvFrtgk0hsPxuaSmFm1dpgSIZxoYGj+57oOA/1tJbc1hL0PIewrR821ZatHRHGWdE+BtR+cglMy5Mv729J7EqPG9w0FIVVBEUhfv0Unuv2l952UiCfsKsAPc5nTdcGp3cWEXKVbnH5bN9VwB3y0xe6chBPawtbenOtclCid0BHS2mtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEZ8Gi5RsGKtUtgJPfh2lCDuAwqvk7G4DkBDYyMJp0A=;
 b=od+JKPcbUHV9nQ45HBi/hsGwfeqlpuheGDMbeYzlbj+OhY+MvINeZ0vr2J6nUSUud3tf7Yf3X7kNSe3EpYXs2HBbK0HMPWawlQU0AmqQOzAfrLAhC41ye2KP51EtpNLGYnHqIZEnsoikRL5SkEcLMkbavAdaPZA1nULD5Sq2+YshdxsXza0eoLCjUJaaJ/RfLtFedXcjjscvqavBOKYbzUHdxpSZc2rWAZOXJe0iF3tuqANuPKzxxGa5fWaJZELzTUqsJE9tO9R3R/5uy9JYCMMuYSG8B9Yf2OuwxlHdPd2Z587RVF7KHJDlOcmYdJ5xNQFiD7UeN3zmmQho5ViZcQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB8473.namprd12.prod.outlook.com (2603:10b6:8:183::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Tue, 29 Sep 2026 21:48:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 21:48:52 +0000
Message-ID: <871c3222-8578-45b4-b402-41e69a522a74@nvidia.com>
Date: Tue, 29 Sep 2026 14:48:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: nova-core: restore the "Probe Nova Core GPU
 driver" debug print
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260929210749.409380-1-jhubbard@nvidia.com>
 <65f49657-175d-43f1-b172-62efe5cceb28@nvidia.com>
 <DLS4P3YCF18J.3BYXSPOVAN69L@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DLS4P3YCF18J.3BYXSPOVAN69L@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: b66e35a9-00ff-4e84-657b-08df1e737394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ueLExs2G0t8dT8ax+UXH0MeA9AtcOj6EtKjJok88wtj5hsCThVMgWn/EOO4hx6K3K4XfTzlDfno5duTM3b1D8XWfDxE62UZQcqUUCzpHG5uRqw4BKwk6xeKNv3N1MFSKBJOe5sp9t3lRWkSLq0kckkjD9ZHNnxryXk5p+E4Y+8sZJ19ZtpFFdNRTBNuHbw+I/I+t5yB/Wgj1puTjlzC5U0A6gY3KMcFjsh/FuuYqAglFL+Ft6ZkTHrCvCwsdIBKiqUQdkyvLtup4vD8jhlHgpIU63kcl11HlZA9W7W3x09+lFzioepmEWOf+5OztdwUOqLDLB/fotyBgFeKL4uQ9QxaNMDcwygKcKLhk3O/DVG+oBpiZ9H7lTOX7g19khbdGc619DysgqG2FSscbcOkViJ98kM+F5cYjFAGQxBC94LOY0hP9bb1XiDDfxE7qHCDBZlxj9x+kJWqcQC53cYAayum1Afr+PjD5cqoVe6+hyDw60kqhAakUZwdMbFJdkry4C/gOhXOHrdkBVQEm2LdanyYwlityL7tDC59kjp+H4Pv9PD9mINej+t76EusD/2taOn0rTEqzK59fMdXPEbzI1CL1Ub/vAqN/aqdf8G0wz6Lg8kbxIp67YyOIqIpGwGP0RG3r9f6fxr4SimSO3iiTU6pEvv5sQ6kY7oETAaF4MzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEJ3SXd0Y0MyQmV3dy9vUzJ5VnpOTmx5M0xkRXg2OWtmUkx2RTl2NDFzWTlW?=
 =?utf-8?B?VXdxT1BvdVdpWEFzS3AxTEFVM0krQUhPTm1tMktkaFJsL3J6UTZ2UUdEWDNp?=
 =?utf-8?B?MkNiMVZ6ZVRsVDgxOXJYNlFrVG1Vc3dzRTlnZHBTWFVXWWhLVkNmQUxxZDl3?=
 =?utf-8?B?am96RWc0OUxxRUtvaHkwaXRIUDVYMjdtMWpqL043Q3crUWsxdGgvVjNmQnd0?=
 =?utf-8?B?bE5PbEFqcDR1K3FlRXdha1M5RCtZZHBYdy83UFM4NThHOEZDUHYrS0VtVnY5?=
 =?utf-8?B?SU9lSUN0bHZKTU54VzRneWNJWnF0bEZqclVDd3laRzdUQXFGSStxcWRZN0FJ?=
 =?utf-8?B?d0o2d2wva2JEY3ZkYVFvRzUyL0lSNDYwYjFTa2RlcW42bkc1UlhXcjBnRmt3?=
 =?utf-8?B?dGlxaTlLRG9FdkpnSVFmVEEzMFlTeXd4NTN3M1FDM1Y3VWFFY0YzVThlYzRj?=
 =?utf-8?B?YzZSdFBTK2lTUVpnL0d2ZkFmME5SVTdXSXJxTVpIK2lqdFN5Qm92MzAvVGxj?=
 =?utf-8?B?MkhXN3Vqcko5QVRHMGdrUWFERmxHcmUxYzIwNk45Z0QwVnZraE43RnR5VXJt?=
 =?utf-8?B?cFB1b3FoNGJtR3ZnaEQ0eVVhbTlEZFI2WWVvR0hrRlNHTFVkYjc4d3pIdEsy?=
 =?utf-8?B?aHAwR29uTFYyOUhEUHFaWkNiUklHME9xV0krTHFQZXo1a1lMUk5uTmlRa3E1?=
 =?utf-8?B?c0ZZUEpTbWhHMnJ5aUJNUFlDRUlsZndTOHRPZ013VjJnbk9QYU1LOHRqbWsx?=
 =?utf-8?B?UDJCenMyek9JMHlqaVJqS0RhbFRlSUllYjVITDd3ZFMzaUlVRUR4N3V4Z0Ju?=
 =?utf-8?B?RG50cEdxN0VuTnR5dTVBekdKeDFPM2RYdm94eWVRK0M4OHU1bkl2UmliVnVL?=
 =?utf-8?B?cmFFU1IyaW1NMEdpWGRTbWhySDk0cEpla2FLVFVuVWo0TXEzaTN5ZlUxbVFt?=
 =?utf-8?B?MlVybEdiR1BHY3piSG1yckRVNStia0pIMTZjakpzQXhwaWtrT3VCTFlEMzQr?=
 =?utf-8?B?QnU3NkFldFFLTXJ2RTg5Yy9CZ3NWT0hmRXZZc1kwdGpZS1RabGp4a2Y4TE1F?=
 =?utf-8?B?K0xRMkpBdGtqZkVZMmdMQ3Z0TjJWSzQ0aEtLdXFGYk9ObTIxRUE5VkVtakI2?=
 =?utf-8?B?djJVRE9vQ3gwV1JuUWdYbWRjSC8waURvVk94NU9TSDZVQ01BWDh1SzllZ0l4?=
 =?utf-8?B?N2FwNmdSR25mbllDUkNMU0N2cUpYYWc4NXIxVTFzWFU4dVJHbW5HQ09UUkFu?=
 =?utf-8?B?czZ0TlNtSEw2MnU3TVFkY0g4cFpNNjZ1MWo5UVViOUljK1ZnLzRPU2tHVkQv?=
 =?utf-8?B?NlRTK2JGV3grSlI5Slg0T285NDhudlAxN2N4bWdHSEN0TFM1cEpPVGhSTHJE?=
 =?utf-8?B?aEpoWm5YY1h0YWNaV2I4MVAyNjFMd1Jka3BFbWxQUVJ5SnNIN0c4WDlxYWFV?=
 =?utf-8?B?a1o2Sks3d052VGJHcGJBOFhkb0g4MXd3WFYrYm5Rd1laZnBuZEJpcFFiVTVr?=
 =?utf-8?B?cVlqSWR6VXZGWGRrL3Ryd1VJWVQrMDk2eUNGbHhWbllIZnVUbkVuOEo0a04w?=
 =?utf-8?B?L2ZmNWJORDRGTkx1bTNBcWNySWpSRk53dHlpeXUwcUxETnRSK0tXeGtGeWdL?=
 =?utf-8?B?K2VlbmtjWFhKRVVxbzNYSXhZd2w0UjRRbGg4RUdCWi9mVU0zdWxlazE1aGd4?=
 =?utf-8?B?RzhBYVU4cWJyamkvWnEvaGdjRlVjTWhPaVNXRkRuT1FpWGtlWHNCdlNoZmNi?=
 =?utf-8?B?Y1hvVkJmNDZOM3ZZRFNSVDBQR2o0RU52bHNvajczVmtNSW1wT1c0Mno3VHhR?=
 =?utf-8?B?NlNvbHF4TkNMNExyWGNmNnFYcitlaEVTU3hXUDloZWpkWGUwR3cyYkY0Z1dw?=
 =?utf-8?B?RGV6cGIwVTQxQXBJNWl5RDdERDJ0bTQ5ZEFyaTFWWGtHdFN5ZkdnRU5NdVVX?=
 =?utf-8?B?eDBMbnR2dG82TjZQaHd2eVg3ZmVFaGkxMjhacXFIdWNMTWZzV0ZSZmJXQTQz?=
 =?utf-8?B?WlhMWlNUNGpvRzg4MmZnVXRNRVE5U1BmcFAvemxqcVgxZDF2dEU3MEZXMi9Q?=
 =?utf-8?B?b1hMTWtoNkMzV1pYUC9kY2Rqb0ZPby9xczlML1BBYlZlN2FJZzc4TDFFcnVh?=
 =?utf-8?B?c3YwZGEzdlgvTmpYTDFUN3lneXVWYUlLeTVyZXhuQm1MNmhhakNYdTJGVmZC?=
 =?utf-8?B?Z0JjK2wyR0ZjOFB6SmlhZXJGSjZ5a3podjd3TmE5WnBQZFBmSzBzMEtXeVIx?=
 =?utf-8?B?MzZNb0Y5WGVXVnQvM0NTeWFiUjYzZCtETkdXamtDRWlFaWp4SFQzcUdJWUpz?=
 =?utf-8?B?UHVma21CbjducWdrN0FWVnB3TmtlOHZ1ZTA0YWVlc2hhK2dxVWFtQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66e35a9-00ff-4e84-657b-08df1e737394
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 21:48:52.0582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9exEfUvTzGRh9SQKqd79RDIefc3S7bmzjPThcMrUufkJg08IQdQ5Y2Fmr8IYGzHMeEi6yOQtN5RgryXUf4lCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8473

On 9/29/26 2:46 PM, Danilo Krummrich wrote:
> On Tue Sep 29, 2026 at 11:34 PM CEST, John Hubbard wrote:
>> There is a trailing " at the end of that Fixes line. Even though I
>> ran checkpatch.pl on both of these patch versions, it didn't flag
>> it.
> 
> Thanks, I can drop it then. (Though, I'm not sure this should have a Fixes: tag
> in the first place.)

We can just omit the entire Fixes line, yes. It's not fixing a bug
or anything, that's true.

thanks,
-- 
John Hubbard

