Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011010.outbound.protection.outlook.com [52.101.57.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CDF35E1AF;
	Thu,  3 Sep 2026 03:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407838; cv=fail; b=k8nFozt5Nh6TiM1sbuo9lVMhkST7Fhkms9gypke8LycXKh8nFP3vQ++IG6WxJ4Y7M5wgS1Rkpa8/konYaAe3kyV/11r0q+86JHs6A3rQAYmi2IC+yuiNai56noZX0Rsb647gQM8NJU+qFvoHnMKIsz8t+gJ7zZ2equhC5iEO5gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407838; c=relaxed/simple;
	bh=UH28MahiBQn766MbteK8RRsF8jJ0AORpRQBniic/hnY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DVL/ONRXbCcgukw/FDpfo/W11qlnPhRY4by6diPvNE+5aq7N05g5Zzm4jcQGEEdwXF4CAU2vsxJCU8sDOySPDhLWav/XDCEj38zzubwydTEkdZat+MgTKNlLylqCeNkZqkI9ogkYyPKGJOfKYIbBrYUejudJ4bKpps9H/NpyGhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d5Cp3zOU; arc=fail smtp.client-ip=52.101.57.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d5Cp3zOU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zom2IywMiqae/QPidzx2ev5EXionikHqvRgR7iyyOC66AJbmHrGu66sxuphKogBQbkwZ5ZdqQ5fh3vgxW3bl9e+JjzeWBEC8PR+1byLtn2cHvKpsh4qiMyNOOYxSEI42byh0gvJIJbO5EvtozqGDAPpbEQG4pvC5I+LcAnXg5pVVthMMEx7P9gOGj6SkBAdGD/e/mn7h+hd5A6aHHBahqAdvwi38K4S1aWQ5VwjWWXSUiMlrif5sIJt7N3jqwcs/CBoAZCr/5UKm2AXauIIYpBhnh43YZu9hwdPxOSBDOJvcfyOxH9E3BceIDeYKG7en4aHxPn5+HB+/gH2903w0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5Z2d6zx1h2dBYWN6sNoPK2ByVT08b/+V7O2fhhtcyY=;
 b=EqK7qHmwlTEBrsRDOMO/5bTFOhDWTv9YXxax8OsOhInzSCzKtyUU/aY8r6z4xEX4V4+lsSqCobB59A0f8dQ+I1oOV6MrkOhrEmt2kl8k2e5aQnfl9pntHG3TkRnMpS9GnoiwyJepDvyVcRa5ApQWf2KEukARg1G1eC4H4vLI2lJnnWGq7rUf5GvkbhYrbRM1y+sApGgO5jGpCuoTS2Se2Gpsqq+0sScopKYBpwoNFqoXqu5gldaj1xHGJN0sTDCYQFC1/ovbSthySXPCI706irT9RSbzkDZQ7YQqu9uV0GNUyL+rMCusPqTtjT2Iq2NRSlILI6ErHnpXJCLkK6LQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5Z2d6zx1h2dBYWN6sNoPK2ByVT08b/+V7O2fhhtcyY=;
 b=d5Cp3zOUWsdZlC1zYJiPHisiuEP3hnoubc1LMmGp3Rb+0rIccYscJ+I2Kw+JNSPyxqeNqccgrI0nVGjCevkF1R7jBObV2XLZ6f0gZy19CCNvpni/XabEA4/DNwxE10pL/cOj01XbThr4uE/4il0NXXjaWiBvYzgjiXlrsYKUyHdIRW6NlcRvfbeLSa06mF5zzurVLZ5lbmc8+qmCld+N59YC+tfcnHlB8u3Ge1e7yHIpugAlSF1OLeFHK0138vhoVUG2Gb6dZqNk6sEXufXK5dioW9u2URiZg+HGxxdYMrKqraNemXVc968J2IIIV2l4dDGM9T4I5LLgXL1Do9uQOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CYYPR12MB8654.namprd12.prod.outlook.com (2603:10b6:930:c9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:57:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:57:12 +0000
Message-ID: <b7d5224f-8dbb-45c6-a34f-d6c6f5c06788@nvidia.com>
Date: Wed, 2 Sep 2026 20:57:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] gpu: nova-core: add an interrupt delivery
 self-test
To: sashiko-reviews@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Will Pierce <wpierce@nvidia.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Boqun Feng <boqun.feng@gmail.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alistair Popple <apopple@nvidia.com>,
 nova-gpu@lists.linux.dev, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Eliot Courtney <ecourtney@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-8-jhubbard@nvidia.com>
 <20260903032942.2DA621F000E9@smtp.kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260903032942.2DA621F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CYYPR12MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c50cd69-a3f9-4e09-b43e-08df096f6f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|7136999003|6133799003|10067099003|11063799006|4143699003|56012099006|11062099010|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e0jhHuIpFDcu4NKyqVpf6iihByuvjUgb2kmAkMeWzJFN2XtJQfCLKmFDw+IJ1b6Zx8CLpvdSesONHCn+o198NYxErfWvnmA3YWfYZlrO72ffNbPRSxgM+/Q8D2Oagni4KeLK7tYhlKuKMPj6OQN12CoapzPM0eApb1ZQbiC89ow/BdM+CsRlSjCF2ElQ0bL1jvtal12khiQrAXKWQbZN94KS+B3kMvP5Ng6yJiB1GS7L09j5z3CXPGe4+/etEaPwUAfc8QKjg5JlAJam83FC1Rj0wYH4Rocx9EzKIbfM2sr/dHa/K3MeFIimF4O00e9AYRv6ixNh5TdK7of4JqKht3FlWpB0yhM3TIIVU28BP9XjZ7jnV8L1DYLcg/I9ykZfCqkdL9ZCr9wi11OfsIgXPiY8GFf3lYeezyyUgl2OV5snYESGAOZv9SAUoU3OVc9mQWh8q6L53YxSuVfXHWyqQncYmDTmF1N5oL6O7FPgCo5niYBeuL1tAZx4CpNx+ZSQM9/hSTSEgaGE5Jh5lMvqTfQUrwGGFjG+jPkvLcM7fUMCQfzbmKX4YrJr5ywjg1pYd2AlB+Iyzf+MgKQ2vfPK3XlDydU1piVaq9bFLAYJ5J106syacjLIs3qP5P4VueS3KR1WlyacweQlQwcEqdtHIVyS0rN7Lo2QMffHk39HcjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(7136999003)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(11062099010)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3B0ZkkrY1cwL2xLQ2VaeG9SellsVEJFVW8yQjkxTCtrUWtxVWF6d055SVN5?=
 =?utf-8?B?MHUxT0xnVnZ4bS96bGZvcVRXWjhyeE9pd2VVN3RLdTRXS3pOWlErVm84TFZr?=
 =?utf-8?B?cVR3WHB0TEhMQ2ovVXFLbjUyaFNLSXBEaUtYV21TOE15M0Q4STYzWFovRDhm?=
 =?utf-8?B?a254cTQxY2x5SWF6bTkweEEzMVF4bndobmJwVFlwNXpVTHliSHNHY2xPNlJn?=
 =?utf-8?B?VjgzMUVZYkJIY2lvUElnT0s2OWFpRDNuSXdxRHlnOWhBaDZNdEJSb0xNVlJ6?=
 =?utf-8?B?LzFnaEFOU1RhYmVWQ29lWG1HcC9mcHhGeTlPaldCQTQ0Z254VFJPOEp2R0VF?=
 =?utf-8?B?cDJJdWFNaUlYVzBpT0ZuMkVRWWhHcFcwMllEOWZwTlF6bzlEVlhxV3BEcnMw?=
 =?utf-8?B?anBJVGUwK1gvWVBOcXp2TnU2SllQU3diRDBUb0xNUVlKRGltcXBuMmY1TW92?=
 =?utf-8?B?TG5KS1k0b0Fhcm9WMVlrU1ZNYkVFdjhMakJJMFZ4VTVrck8vbEdtSVZ6VTNV?=
 =?utf-8?B?UTZJZkNJOXhMcWgzektqOXhaY05WQVVMRmhPRm9ReEMzbllEL0IranJUR1g1?=
 =?utf-8?B?dFl4M1E3UENtMkNFL0FNTXhod3RlU01abUw1YnVBWDRXTDRVeU5EYUZPZXJH?=
 =?utf-8?B?Y29kWmY2ZHVmVis5ZTlGTi9PbGxkZUovRDFSRlVFcEpIT2phckZtcmNYRTBn?=
 =?utf-8?B?cVNFYWtteElTZzl3WmJjK2xJS1dYUWZ0N0FIL2NyRXlFTFFGU2ovUVR4Uysx?=
 =?utf-8?B?Ums1bXR1LzBjWjdteFY0eGdLaDZIQjY4Q3YxNkw3RldYWTliK1UvZGE4aFVJ?=
 =?utf-8?B?VXh5anprOWxTRE1jM0lTQlFoWStWMnJFYTcva1hqQ2hraFB2Q1N6OUVZZ084?=
 =?utf-8?B?M0tpWXZpTFJySHZ3b0R6aG9USklsZnYwNW45SUZNcjBudWF0VjViWllVT29V?=
 =?utf-8?B?Vm5xanlMRi9wTDJQV3luWVZKTG0zemhxZkhKVDJVeCtuVWxTaXB3OHBxRzRr?=
 =?utf-8?B?UjUvei9WMUpTemhabUhxWTF4QWZ0RGdMZzR5akVMQzNZSnVpbzlzM3FJT3lI?=
 =?utf-8?B?YzVpSmF4WHdKeHMyc25FUk0vN0ROTDZ0d20zM1d1Zm5lM3hKM2Z1ckRZYWJy?=
 =?utf-8?B?KzhrK1NtYm54MnZtbldlMHFQWTFMSnlaN3ArWkpuNWtrY0ZrTVY4b3hnYTFR?=
 =?utf-8?B?SG9JaGhsalBCWGdQdzBPeTk1d09zQUIvMlNrUEJ5OWVEUksxazhCWWhFa1dY?=
 =?utf-8?B?Q2UydHUvOFpKT2RYMGxJSHFON2o0eVQwQWYyeDR3Y1hHdkZ4d3JHOS8wZGFL?=
 =?utf-8?B?M2RabFhRREYzS1h0dFQvMkpxNUFMNTJ4dmk2ekVDYWxSRWVUWElwc3ViVFRU?=
 =?utf-8?B?NmdlR1d5aHFWVmlSZ1lvRVd4TEtENHFJMGRNOFhMY0tLUWVFQlovdmZNVnRh?=
 =?utf-8?B?ekFDVkxqNCs0TFFJdzEyZDJzcGlrNGJXY1AzeVNtNnpmVHp1YWhOR0xOd2Jj?=
 =?utf-8?B?UU5nd2FVMTZaWGw1Z3NhY1NDMFQ0U1loK3Y0MkFRTFRyVVZWTjBQSW42am5R?=
 =?utf-8?B?WnlIZGROMVRFSk1aVkYzbDh3VFkwNGhKQysweUxmYUtLNzRpRTB5VFRGV2FE?=
 =?utf-8?B?VWZ1VU4rMkZHcFJNS2dZQVdoNWs4WDR0THM0enlDdGh3VXVBaVFJVGJjd29V?=
 =?utf-8?B?ZFM5SFpHVGtYaks5ZDBuNlhGaHdDRWFDTmJUTG0yVFFrWXNMWEtMOUFPSjJy?=
 =?utf-8?B?UEpZeXJ2VjN3bEtZSEV3dDdnMGdNblQvRlRiRUNoUFpxS1lsWDZtanR5bWgw?=
 =?utf-8?B?YTI2ejkzRHBSQkhZaTAyNGdMdFFWNFlvZU1VcXVDd1VFV3JSRTZXSjZSWFU4?=
 =?utf-8?B?ME9Oc3ZseVU2b0c5dFRCVlJNdFIyUjNoczlYY2VaWkNIdFFkQzM5dHhLUng0?=
 =?utf-8?B?bGxiTzBkL1FuZ2V0RVQ4SXkxNnc3enQxcXhqbjVMRVkveDJsc0tiS0JjUGxO?=
 =?utf-8?B?RFJCMWVvYWdPWmZxTHBwdUlkNHZ0UEJKbkFMdzk5Y0ZpYnZURXFiUzJTSjNa?=
 =?utf-8?B?aTRIbjFUSHpRYXpWUzJvY1ZXMlc2ZExsUEJQbXlBQncyWFFoZldQZ3FIOHhj?=
 =?utf-8?B?dzFFak9xL09IblE3UGdkTm9RRGI4bmpsVVNQV2p6NWpSNEVuZUNINVlYY1R0?=
 =?utf-8?B?SHZ5VTBDTURGNC9nTWZRRHVwYXRtL2dkOFZTeUpiNlFGWitQcmhJWnpSQUxT?=
 =?utf-8?B?MEUvaFRtUGNEZTIwS1NreUZtRnp6S05SV0Z6TVF0MzFFWGxnemRZc2JGY2tL?=
 =?utf-8?B?SGNId0ZBZWs2eTZzcE85MHY2K0pxWkZMYjh1MkNzdTJwcXRXaVgwZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c50cd69-a3f9-4e09-b43e-08df096f6f29
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:57:12.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJaTSohSRW6VcnEWlbXCNUxq1G/MMHNOgX4eybX34BJizOTR1MKxmdaD3ftWnq+B5C6rdNty1pFKlcCYtTij5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8654

On 9/2/26 8:29 PM, sashiko-bot@kernel.org wrote:
...
>> @@ -330,6 +337,12 @@ pub(crate) fn new<'a>(
>>          let dev = pdev.as_ref();
>>  
>>          try_pin_init!(Self {
>> +            vectors: crate::irq::alloc_vectors(pdev, crate::irq::SERVICED_SUBTREE.into())?,
>> +
>> +            // SAFETY: `vectors` is initialized above, lives at a pinned stable address, and is
>> +            // dropped after every field that uses `vectors_ref` (struct field drop order).
>> +            vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref().get_ref()) },
> 
> [Severity: High]
> Does this create a dangling pointer under the Rust memory model?

Probably not. Perhaps Sashiko doesn't know about pin_init yet. :)


> 
> `try_pin_init!` provides access to previously initialized fields via local
> variable bindings, which expire at the end of the initialization closure.
> Taking a reference from this local variable and artificially extending its
> lifetime to `'gpu` via `unsafe { &*... }` violates strict aliasing rules
> (Stacked Borrows / Tree Borrows).
> 
> When the closure returns, the local variable goes out of scope, its
> provenance tag is popped, and `vectors_ref` becomes a dangling pointer.
> The `pin-init` crate also explicitly documents that creating references to
> fields of the struct inside the initializer is not allowed.
> 
>> +
>>              spec: Spec::new(dev, bar).inspect(|spec| {
>>                  dev_info!(dev,"NVIDIA ({})\n", spec);
>>              })?,
> 

thanks,
-- 
John Hubbard

