\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \twotwotime \key d \major \time 2/2 \tempoMarkup "[no tempo]"
    r2 d'
    cis d~
    d4 fis h,4. h8
    ais2 h8 \hA ais h cis
    d2. cis4
    d d2 fis4
    d cis h2~
    h ais
    h4 d2 e4
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \twotwotime \key d \major \time 2/2 \tempoMarkup "[no tempo]"
    a'1
    a2 fis4 fis
    fis2. e4
    fis2 d4. cis8
    h4 h' g4. g8
    fis2 fis4 fis
    fis2. fis4
    fis2. fis4
    fis fis2 a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twotwotime \key d \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 d'
    cis d~
    d4 fis h,4. h8
    ais4 ais h8[ \hA ais h cis]
    d2. cis4
    d d2 fis4
    d cis h2~
    h ais
    h4 d2 e4
  }
}

SopranoLyrics = \lyricmode {
  Sub
  tu -- um __
  prae -- si -- di --
  um con -- fu --
  _ gi --
  mus, San -- cta
  De -- i Ge --
  ni --
  trix, no -- stras
}

Alto = {
  \relative c' {
    \clef alto
    \twotwotime \key d \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    a'1
    a2 fis4 fis
    fis2. e4
    fis fis d4. cis8
    h4 h' g4. g8
    fis2 fis4 fis
    fis2. fis4
    fis2. fis4
    fis fis2 a4
  }
}

AltoLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di --
  um con -- fu -- gi --
  mus, con -- fu -- gi --
  mus, San -- cta
  De -- i
  Ge -- ni --
  trix, no -- stras
}

Tenore = {
  \relative c' {
    \clef tenor
    \twotwotime \key d \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    fis1
    e2 d~
    d4 cis d h
    cis2 r
    r4 h e4. e8
    a,2 h4 cis
    h ais h d
    cis2. cis4
    h h2 cis4
  }
}

TenoreLyrics = \lyricmode {
  Sub
  tu -- um __
  prae -- si -- di --
  um
  con -- fu -- gi --
  mus, San -- cta,
  San -- cta De -- i
  Ge -- ni --
  trix, no -- stras
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key d \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
    d1
    a'2 h~
    h4 a g4. g8
    fis2 r
    r4 g e4. e8
    d2 h'4 ais
    h fis d h
    fis'2. fis4
    h,2 r
  }
}

BassoLyrics = \lyricmode {
  Sub
  tu -- um __
  prae -- si -- di --
  um
  con -- fu -- gi --
  mus, San -- cta,
  San -- cta De -- i
  Ge -- ni --
  trix,
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key d \major \time 2/2 \tempoMarkup "[no tempo]"
    d1
    a'2 h~
    h4 a g2
    fis r
    r4 g e2
    d h'4 ais
    h fis d h
    fis'2. fis4
    h, \clef tenor h'2 cis4
  }
}

BassFigures = \figuremode {
  r1
  r2 <5>
  r4 <6> <7> <6>
  <_+>1
  r2 <7>4 <6>
  r1
  r
  <4>2 <_+>
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
