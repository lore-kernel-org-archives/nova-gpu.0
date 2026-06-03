Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C249018872A
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 00:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780446069; cv=fail; b=amLcmvjStYhZcI8bPYiiyABtrAb2AWpDLlUMWM9hmvklXrISVINl+eyetRm7H+MTLMWwoGWS/DppuHEqBZLKex3BHP4K+xZRZ6dUwb+4NQRkGbjZtqDwVqX70LxS0SNT8tE6IX3sOT2ZkPw/Z5KgxYIIDoFlfYXwJagOB3h3zTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780446069; c=relaxed/simple;
	bh=yVHULk31YisGK+zvyeMbKn7jcb5SPJ/mQjHspLCI9UQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=o5sc8v88XlJEWL9NK+Mn0D/S29+XcIHRPuRnG07jIqlc/8vczaOd+JwCIbD54uWIWYIyAgnvkOB5B7/G/VsRqNz8FFts0ye7UHFkZ6GgDEChJwlHGqqPdYo7Tvu8/kz5tfLE46R6/TZEgu0kKJFdPT0UyF3KIcubLb/C/QeBx9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qj9CHA2l; arc=fail smtp.client-ip=40.93.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qj9CHA2l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zATXi382i3HgMxXwqw+df9SeP0BQxsedKPtEYmAY4JGcPDxqMxNZ3j4Q3oCjiRRbOtPtDgFlbHu58oJJht+FtqdOOoGgRj/cTWDHFzSca5xxHnfPWgG72CWtS/jJi2R+mi9e+NTFYhq6KU06XJ2+pXawQsUdEG4a1BValerSgeXj7SiFaxkOhpYvzhi7DqIwZUbVQETbggyEzvRVf1n539KcSB7GROgNx+MS9AH6wHPUHuDLcC89vDi+rGhlpgdiZbUXRTQs3u2gjzaZgGDiGimE3jCDyfxzLJirgUP91qIr6H6Mguh+BoOLVtE5EK/1qS6HbLTj3ZoHoMJX+ZLstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7rQZO7lawT5PMJgQp2ynSqVuXPbhxmuzXRTk4yu+nM=;
 b=HE2T7ms2Ha8aA4VYI6F/9nQot3L74xBZ/hfofIuH4hqRGhhPUrkJVCwy/6QVZVmKKAtQOlk763AvYtP7nw6eDfQ4lDdeyosoB5NDVXEVuagUAdnNZQE8wZ5M842wQbr/EaUm0l68chY9u1yVRHArcD62tdmYy/fCyxyFx2tZv5IMmHePTE+6RuTbjBNqcpRCQHSj+ga0nIPaqbKJigAvDF3DJFpVfDxqiTf0QnNa8jwoHsXIFaXDL3lVaaaplRuAO2f1lk1u48s7QpTUgxqkm8SEucPs4DD+Lst3JrQzmFQ02Qnl+5/ZKKNqjZns5GaCNS8p07PIQdGlEYvYO/63CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7rQZO7lawT5PMJgQp2ynSqVuXPbhxmuzXRTk4yu+nM=;
 b=Qj9CHA2lpPOrbx4dFWQV91lqAicVZCorogp2pjaglPo7s64tPX0st67o+ih42eJOaVx3dj3h9Z8TjKJiSxpBMo8UXAdSOAZRd4Sx+FDhFOl1zeOnv6JZYJrVN3wH11m4WsNgM+j4WmOX0/v21xocYuY2P7q52Ljxdqs/zOamMylZv/cLkH+3d8JTN2Kfv6LOItX8hwM0kihcZFJCyR6AcX53TwpF5gmi4PXxl9lJj7n3fiv2OK8Z4UsrczixEd2nQEFiAZ4qDhL2WcUTnhdlKVlF0iUT03jy8FXxHKDjo/JSH9uO8UILeSIuOBbw7OECrdm6NrwUcsYMPcBN1i86Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Wed, 3 Jun 2026
 00:21:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 00:21:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 09:20:57 +0900
Message-Id: <DIYZGBDIVOA0.1Z6FRXE3D4JBC@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "Zhi Wang" <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-14-jhubbard@nvidia.com>
 <64527605b77c8eb3658da549053d31acdcb16147.camel@nvidia.com>
In-Reply-To: <64527605b77c8eb3658da549053d31acdcb16147.camel@nvidia.com>
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: d447b095-083b-4e2c-c83c-08dec105fef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|56012099006|11063799006|3023799007|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7tthFyEt6DwSnQxWcAdY22AkVV5o4EnKcf+tWXme6pJxfDgFkGgqeHYDURn2x2g7Ko5sG98zQlCSx5Rs8KUlnEtbrbCFHMk3hZAS1y0CyU3Mklfnz233sv/NDgHBbpOEJGnMkOwOhD8LynarFSX0ItyWePNgGvfgtI3wDi+ekCAfRvPW4aFf8gyreiCcWz70DzKfc0TXgcY+IUdomVEy+1eIPa3HEPG+gOIQvh/apZYJvXeSD3lQlCBz09Vqp3GxRuAXy7LpmKC4OBZgVUkHjo3fqFu7BHjznPzzuDB76+42nYeVv05qKU7tNLGoAq9YN3nNUn/2CI7Q/xdtcQpzAofujTLAzoPRvKW6mRgcRZ0H7WRN3UrnKroeChqh8R327X7y995Du/Pmj8VDVx/psyF4f3jE0m9dhg1idmcOp5Tg0J/FszScIEhiQF1c5ETRAykiyg+5N9Q9bzIpvNrA9h4ah6MPa04yCYC4oVVfqfzlzW41KNt6mw32AVu/AxfkLMo/8xlM+2Y/xnY5nhOorDSgtbT4Ms5+a/h2mwyu5UVCsMUTe+B80o+PLYKhT4gPUxsye8Goj5t0XAzowQ8r/kgpL1gYFDMOsHkHlWrUYOQT5g5D61g6dNzhYuAa2/KqcwYCD5pyUTETxA4vGA5f6iDTHmSFDmEI6uc05klf3xFRYja8MhXeWlF2gIYKgvLW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(56012099006)(11063799006)(3023799007)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGh2OGVMV2F6NWxJakdMTjNMeCtIa21vQTdFNHlJVzErZUt0ZDBpSnFUcjln?=
 =?utf-8?B?dWdHYXdsellJT3FyblJyNXZGVDZRS01meUlRZ2syMEpsYUJxZS9qZ2RXRVl0?=
 =?utf-8?B?VmlvRktHUXNhdXpsRWF2Z1I1Sm1MRkVEMTlMR0JwRlBHRklrbUtUZmJvWW5m?=
 =?utf-8?B?bGZManRhb2FlZ0NEdFpkOHVzUWMrWHVWWG94cWRvb2RKdzhTaDZMOEs2dTZz?=
 =?utf-8?B?c1VPSFhRSjlrV05yQndnTHRCdm9jSUJ6Z2hlRkFWOW9BVWlyclVQS1U3UDQ0?=
 =?utf-8?B?cm10TkFkbStDLzFiV1p4Vm5FMlRGdExkZ1UwZEhJNGFJdkM2bTE5ZmpSQmJN?=
 =?utf-8?B?TnUvby9FNU9BZW1MaDYrdTRSalVTN2hvY0wxOGJRcTd3L01GbXFQeDVNV3Vj?=
 =?utf-8?B?b1lDUVE4UUdVNE1vUXF0dDdMaEpJOUlLZEs0cXdGM1Z4ZlU5c011VkZ4ZzlU?=
 =?utf-8?B?THFuUC9FVDNieEpCZk5YUUN3V01OMVF6SjRWRWNLZzd5R292VjR3UlFwczM3?=
 =?utf-8?B?QjRPaTl0dHNNdWEzOWVpVVFOVEJ1TjAxcDFnNGR2TnZpNjAyQ2IwbVZpWFdB?=
 =?utf-8?B?R250V1FOOEs1c1V4blpjUFYzajZkM1VHL1VtbHBiemMxajBnTUZ2bXg1Q1A0?=
 =?utf-8?B?YUVGSCtqTEJHYThWTk1GVk80VTBaVEZuMjRTeUJCakRaaEMrc09OS1ZRdWhz?=
 =?utf-8?B?QVJET0VHZEIrTTFZbFlnMUtib3hOaFVnTFEvMzRwY3U3ZW9mcUdKUUJFdmIx?=
 =?utf-8?B?d01NT3djQjdySG82K3Y1VGpGbWhMeGJHUnFZSWV6cE91YlpYZjBsQ2wxUFAz?=
 =?utf-8?B?NlpoUWRUVmtDQTFUQlRmenIwSmp6TG5FWjFlbWp6YkJQN3BTQkZQUENJRE5l?=
 =?utf-8?B?VHkwY3pURGYwenE0K3B5RGxHWERJeGNMdlZKS2RFYlZGcGJuOWMzOVpPNm9r?=
 =?utf-8?B?SElxNk9jN0lTZDVzOGV1YS80Ty93Y0Vmd3l4M0dCSThNYlpZdVNSM1d1eWF2?=
 =?utf-8?B?MFE4K3NSajAyV1ovTDNBN3paWVZhZCtZTVZNMTlNL0EyanpiYTdTSWI0L3VW?=
 =?utf-8?B?S0lYQkpRZE5lRlltQm5lU1J4bnBaQ3hFSXppY01laFo1bEVHdTF3RnlyWFpp?=
 =?utf-8?B?NUZ0bG02WTVjaERGVnkzYzB5RFEyVEI1R2tFZTBURnMvVzJIaU9vTVVtWWtw?=
 =?utf-8?B?ejBqOWcrZ3crNXZHVXNLczkybmMvbkJMOVAwRmIya3FOWFhIbzJPUjF5b2o2?=
 =?utf-8?B?L0N1QVhiQnhhdy8zUUQxUzZvWGFhdDFOMUdnbTU0TzVnVG9IVjNTS1BGVFpZ?=
 =?utf-8?B?U25Ncm5sQTZkMDl0QnJTeDZlMFdrN2JXRVpwZk82U3BkcW9mODZ0cFNPVXIw?=
 =?utf-8?B?eDY1QVkyblljRjROSE1Ha1dQWHVYbFpSMHhDYlRvZHROL1BkN3RCOTdiQ2hm?=
 =?utf-8?B?ZndHQ3pQSGhpTDVYQW1veFk0dzVUYzBLdGZtTUhTWEFxcDFHMmp3WWJ6UUR1?=
 =?utf-8?B?YXBtZUpCT3V0aUQ0U2ZSb2pCQ0wvOU1CS08xRklSQURxbGtGRStPS1FURmgx?=
 =?utf-8?B?c2FsNjJIcFRYbzhIQnMxc01CVDdmYTYvTStOYkk1VjN3ZVc1dDJoOU5qYi9E?=
 =?utf-8?B?aW1Bd2pJVmNQWE5XdjJZclJKUTJabkJXQi9sVGZsY2l4d0RRZnl0cXNTMGFw?=
 =?utf-8?B?VkxoeWF6cE1hWkFyYlBudnVHR0VEbHB1M2YraytDTUthQTUwdnFHWkFqSDVp?=
 =?utf-8?B?Z3N3QkxPem9KWFB2R3dDWnJvK2x4YWdRcGZTdHhGcDYvLzgwbVMrNVhSYTRB?=
 =?utf-8?B?dFJIKzd5SitLcmVZU1IyMkQ4N0Q4aHJmSVFYRUpGTnFqeGs4emM3eHNIWmRV?=
 =?utf-8?B?cDkyRGE4MVBZN3M3QVNZNkVlM3Yya3ljc2RLTGNzYVZxSTJJWkVkUEkvdUYw?=
 =?utf-8?B?VDZlTWtpeTV5ekIxR0huckI3KzVJb09zZ1JiaDhnSFZUeTJLOEhrRTNNT2JN?=
 =?utf-8?B?L0YrUnF2RU5Bb0RidGl0Uy8vTnB6ajZ3T1ZZY05zYVVOaHQyZXJaWThXWW9z?=
 =?utf-8?B?bElaOHUvbXVtc3FIZmFJWWxHR3pkM0lENExyWFNDRmRVK0lIRENPUHAyYUlX?=
 =?utf-8?B?V2M4RWlZRlVSSzRhaXdhajI5bGVkdXR0TWczeEU0YVR3ekg1c212OVJHRmNI?=
 =?utf-8?B?RytDNUJTUXJvN1liaTB6M1diT2FzcEZESUZCZFI1RjFQZDZ3WmdpL0VNejNr?=
 =?utf-8?B?ZjVodm9MVVhUQ0VxK1ovbHQ3eE5VY0xySkgrTHVIQ2poclN3QlBETkhvM0cx?=
 =?utf-8?B?ZUoxWFlxbVdNaGVNeEdPV2dtdHV1OWIrRjh0UWZHREJVa2VBN2l2eFVvVjY2?=
 =?utf-8?Q?jMv/Vi7mwL8nPdfNJOcp4LsrJzERsZd7LGAc2zlB87Zo0?=
X-MS-Exchange-AntiSpam-MessageData-1: mHB9Ju67RFHJ+w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d447b095-083b-4e2c-c83c-08dec105fef4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 00:21:03.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zn4XwJL1x12Y05fc8SkGGMtQjnYLhDUk/u05C+92vKKjoiw0jZTwUJYertBQ0M2Qol/3M26fOKxqNo8ymkr3pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017

On Wed Jun 3, 2026 at 9:04 AM JST, Timur Tabi wrote:
> On Mon, 2026-06-01 at 20:21 -0700, John Hubbard wrote:
>> +/// Size of the FSP SHA-384 hash, in bytes.
>> +const FSP_HASH_SIZE: usize =3D 48;
>> +/// Maximum size of the FSP public key (RSA-3072), in bytes.
>> +///
>> +/// The FMC ELF `publickey` section may be shorter, so the remaining by=
tes are zero-padded.
>> +const FSP_PKEY_SIZE: usize =3D 384;
>> +/// Maximum size of the FSP signature (RSA-3072), in bytes.
>> +///
>> +/// The FMC ELF `signature` section may be shorter, so the remaining by=
tes are zero-padded.
>> +const FSP_SIG_SIZE: usize =3D 384;
>
> How can we be certain that these lengths are really fixed?  I can add the=
se length restrictions to
> the script that generates the files, but I want to be really certain that=
 they will be correct for
> all time.

These are RSA-3072 keys/signatures, which are by convention 384 bytes
(or 3072 bits), so I think we can rely on that assumption as long as the
content type doesn't change. I am actually surprised that the comment
says the section can be shorter - that doesn't sound possible with
RSA-30272 .

Does the script have a way to validate the length? If so, I agree it is
a good idea to do so, to flag the problem before it shows up in the
driver.
