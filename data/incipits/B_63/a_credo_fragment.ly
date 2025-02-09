\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 c'
    e2 d4 c h2 c
    c h c1
    s\breve*2
    c1 c2 c
    a d2. c4 h!2
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    f1 a2 g4 f
    e2 f g f4 e
    d1 e
    s\breve
    g1 g2 g
    e a2. g4 f2~
    f4 e d e8[ f] g1
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 c
    e2 d4 c h2 c
    d4 c d2 e2. d4
    c h a2 g1
    r c
    c2 c a d~
    d4 c b2. a4 g a8[  h]
    c2. b4 a2. g4
    f1 s
  }
}

Basso = {
  \relative c {
    \clef bass
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 a2 g4 f
    e2 f g e
    d1 c
    r g'
    g2 g e a~
    a4 g f2. e4 d e8[ f]
    g2. f4 e2. d4
    c b a g f1
    s\breve
  }
}

BassoLyrics = \lyricmode {
  \skips 10
  fa --
  cto -- rem
}

Organo = {
  \relative c {
    \clef bass
    \key f \lydian \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    << {
      s1 c'
      e2 d4 c h2 c
    } \\ {
      f,1 a2 g4 f
      e2 f g e
    } >>
    d1 c
    s\breve*6
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r1 <6>2 <3>
  r\breve*6
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

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
